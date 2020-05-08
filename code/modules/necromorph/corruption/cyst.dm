/*
	The cyst is a fixed-angle explosive turret, firing a biological bomb at anything non-necromorph that crosses its line of sight.

	Its bombs can inflict friendly fire and it will die if it hits itself
*/

#define CYST_ATTACH_OFFSET	8	//How many pixels the cyst offsets towards a wall or object its attached
#define CYST_IMPACT_DAMAGE	10
#define CYST_BLAST_POWER	40

/obj/structure/corruption_node/cyst
	name = "Cyst"
	icon_state = "cyst-full"
	max_health = 50
	resistance = 5
	desc = "That looks dangerous."
	plane = EFFECTS_BELOW_LIGHTING_PLANE //Cysts need to draw over many things
	var/obj/item/ammo_casing/cystbomb/payload = null

	biomass = 5
	biomass_reclamation = 1
	reclamation_time = 5 MINUTES

	var/max_range = 5
	var/recharge_delay = 5 SECONDS

	var/atom/attached = null	//What is this cyst attached to, if anything
	placement_type = /datum/click_handler/placement/necromorph/cyst

/obj/structure/corruption_node/cyst/Initialize()
	.=..()
	if (!dummy)

		var/datum/proximity_trigger/line/PT = new (holder = src, on_turf_entered = /obj/structure/corruption_node/cyst/proc/nearby_movement, range = 5)
		PT.register_turfs()
		set_extension(src, /datum/extension/proximity_manager, PT)

		addtimer(CALLBACK(src,/obj/structure/corruption_node/cyst/proc/generate_payload),recharge_delay)
		generate_payload()

/obj/structure/corruption_node/cyst/update_icon()
	if (payload)
		icon_state = "cyst-full"
	else
		icon_state = "cyst-empty"

/obj/structure/corruption_node/cyst/get_blurb()
	.+="<b>Impact Damage</b>: [CYST_IMPACT_DAMAGE]<br>"
	.+="<b>Blast Damage</b>: [CYST_BLAST_POWER]<br>"
	.+="<b>Range</b>: [max_range]<br>"
	.+="The Cyst is a stationary defensive emplacement, which must be mounted on a wall or similar hard surface. <br>\
	It detects any non-necromorph movement along a straight line infront of itself, and launches its payload blindly in that direction.\
	 It will be triggered by thrown objects, but not by anything a necromorph is dragging along the ground..<br><br>\
	 \
	 The payload is an unstable organic bomb which will explode on impact, dealing heavy damage in a cross-shaped area of effect.\
	  A direct hit could deal up to [CYST_BLAST_POWER + CYST_IMPACT_DAMAGE] in total, with a bit under half of that dealt to other targets near the epicentre.\
	  \
	  The damage dealt is a combination of brute force from direct impact, melee burn damage, and chemical burn damage from acid splashing on the victim. It is very difficult to fully defend against, but acid-resistant gear will reduce the damage significantly."






/obj/structure/corruption_node/cyst/proc/generate_payload()
	payload = new(src)
	update_icon()

/obj/structure/corruption_node/cyst/proc/nearby_movement(var/atom/movable/AM)
	if (!payload)
		return	//Can't fire if we don't have a bomb ready

	if (AM == src || AM == attached)	//Don't fire at ourselves or what we're stuck to
		return

	if (AM.is_necromorph())
		return	//Necromorphs don't trigger firing

	if (AM.pulledby && AM.pulledby.is_necromorph())
		return	//Corpses and objects dragged by necros don't trigger it

	if (ismob(AM) && !isliving(AM))
		return //Make sure ghosts don't trigger it

	//Possible todo: minimum size check?


	//Once we get here, we've decided to fire!
	fire()

/obj/structure/corruption_node/cyst/proc/fire(var/target_atom)
	if (!payload)
		return	//Can't fire if we don't have a bomb ready

	var/sound = pick(list('sound/effects/creatures/necromorph/cyst/cyst_fire_1.ogg',
	'sound/effects/creatures/necromorph/cyst/cyst_fire_2.ogg',
	'sound/effects/creatures/necromorph/cyst/cyst_fire_3.ogg',
	'sound/effects/creatures/necromorph/cyst/cyst_fire_4.ogg'))
	playsound(src, sound, VOLUME_HIGH, TRUE)

	//Move the projectile out of us
	var/obj/item/projectile/bullet/biobomb/cyst/C = payload.BB
	C.forceMove(get_turf(src))
	C.launcher = src

	//If no target, just aim at a point in space infront of us
	if (!target_atom)
		var/turf/infront = get_step(src, dir)
		var/vector2/delta = new(infront.x - src.x, infront.y - src.y)
		delta = delta.ToMagnitude(max_range+1)
		var/turf/target_turf = locate(src.x + delta.x, src.y + delta.y, src.z)
		if (target_turf)
			target_atom = target_turf
		else
			target_atom = infront //fallback incase of failure

	QDEL_NULL(payload)	//Delete the payload, so we don't fire again

	//Fire the bomb!
	C.launch(target_atom)

	update_icon()	//Change to empty icon

	addtimer(CALLBACK(src,/obj/structure/corruption_node/cyst/proc/generate_payload),recharge_delay)	//Start reloading the next one

//Being caught in its own blast is always a 1-hit kill
/obj/structure/corruption_node/cyst/bioblast_act()
	qdel(src)


/*
	The Projectile
*/
/obj/item/ammo_casing/cystbomb
	name = "bio bomb"
	icon = 'icons/effects/corruption.dmi'
	icon_state= "cyst-bomb-primed"
	desc = "A wiggling creature which looks fit to burst any moment"
	caliber = "biobomb"
	projectile_type = /obj/item/projectile/bullet/biobomb/cyst


/obj/item/ammo_casing/cystbomb/is_necromorph()
	return TRUE

/*
	Biobomb base class.
	Todo: Move this elsewhere
*/
/obj/item/projectile/bullet/biobomb
	name = "bio bomb"
	desc = "A wiggling creature which looks fit to burst any moment"
	icon = 'icons/effects/corruption.dmi'
	icon_state= "cyst-bomb-primed"
	var/blast_power = CYST_BLAST_POWER
	damage = CYST_IMPACT_DAMAGE	//The direct on-hit damage is minor, most of the effect is in a resulting explosion
	var/exploded = FALSE
	check_armour = "bomb"
	step_delay = 2.5

/obj/item/projectile/bullet/biobomb/is_necromorph()
	return TRUE

/obj/item/projectile/bullet/biobomb/on_hit(var/atom/target, var/blocked = 0)
	if (!exploded)
		bioblast(target, blast_power)
		exploded = TRUE
	return 1

/obj/item/projectile/bullet/biobomb/on_impact(var/atom/target)
	if (!exploded)
		bioblast(target, blast_power)
		exploded = TRUE


/*
	Cyst specific subclass of biobomb
*/
/obj/item/projectile/bullet/biobomb/cyst
	muzzle_type = /obj/effect/projectile/bio/muzzle


	var/obj/structure/corruption_node/cyst/launcher
	muzzle_type	= /obj/effect/projectile/bio/muzzle


/obj/item/projectile/bullet/biobomb/cyst/muzzle_effect(var/matrix/T)
	var/obj/effect/projectile/M = new muzzle_type(get_turf(launcher))
	M.dir = launcher.dir
	QDEL_IN(M,8)





/*
	The cyst uses a special placement handler which checks for a solid surface to attach to
*/
/datum/click_handler/placement/necromorph/cyst
	rotate_angle = 45	//8 directions supported
	var/atom/mount_target

//Check we have a surface to place it on
/datum/click_handler/placement/necromorph/cyst/placement_blocked(var/turf/candidate)
	mount_target = get_wallmount_target_at_direction(candidate, dir)
	if (!mount_target)
		return "This must be placed against a wall or similar hard surface"

	.=..()

/datum/click_handler/placement/necromorph/cyst/spawn_result(var/turf/site)
	var/atom/movable/result = ..()
	var/mountpoint = get_wallmount_target_at_direction(result, dir)
	mount_to_atom(result, mountpoint, /datum/extension/mount/cyst)

/datum/click_handler/placement/necromorph/cyst/update_pixel_offset()
	if (mount_target)
		pixel_offset = last_location.get_offset_to(mount_target, CYST_ATTACH_OFFSET)
	else
		pixel_offset = new /vector2(0,0)


/*
	Extension to manage things
*/
/datum/extension/mount/cyst/on_dismount()
	.=..()
	qdel(holder)


//A cyst must be mounted on some kind of hard surface
/datum/extension/mount/cyst/on_mount()
	.=..()
	var/obj/structure/corruption_node/cyst/C = mountee
	C.attached = mountpoint
	C.set_offset_to(mountpoint, CYST_ATTACH_OFFSET)







/*
	Cyst can also be placed with signal ability
*/
/datum/signal_ability/placement/corruption/cyst
	name = "Cyst"
	id = "cyst"
	energy_cost = 180
	placement_atom = /obj/structure/corruption_node/cyst
	click_handler_type = /datum/click_handler/placement/ability/cyst


/datum/signal_ability/placement/corruption/cyst/on_cast(var/atom/target, var/mob/user, var/list/data)
	.=..()
	var/atom/A = .
	var/mountpoint = get_wallmount_target_at_direction(A, data["direction"])
	mount_to_atom(A, mountpoint, /datum/extension/mount/cyst)


/*
	Mostly copypaste of above clickhandler
*/
/datum/click_handler/placement/ability/cyst
	rotate_angle = 45	//8 directions supported
	var/atom/mount_target

//Check we have a surface to place it on
/datum/click_handler/placement/ability/cyst/placement_blocked(var/turf/candidate)
	mount_target = get_wallmount_target_at_direction(candidate, dir)
	if (!mount_target)
		return "This must be placed against a wall or similar hard surface"

	.=..()



/datum/click_handler/placement/ability/cyst/update_pixel_offset()
	if (mount_target)
		pixel_offset = last_location.get_offset_to(mount_target, CYST_ATTACH_OFFSET)
	else
		pixel_offset = new /vector2(0,0)