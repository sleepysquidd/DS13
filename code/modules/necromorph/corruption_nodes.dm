/obj/structure/corruption_node
	anchored = TRUE
	layer = ABOVE_OBJ_LAYER	//Make sure nodes draw ontop of corruption
	icon = 'icons/effects/corruption.dmi'
	var/marker_spawnable = TRUE	//When true, this automatically shows in the necroshop
	biomass = 10
	var/biomass_reclamation = 0.9
	var/reclamation_time = 10 MINUTES
	var/requires_corruption = TRUE
	var/random_rotation = TRUE	//If true, set rotation randomly on spawn
	var/scale = 1
	var/placement_type = /datum/click_handler/placement/necromorph

	var/dummy = FALSE

	var/cached_rotation = 0
	max_health = 100
	resistance = 0

/obj/structure/corruption_node/Initialize()
	.=..()
	if (!isturf(loc))
		dummy = TRUE


	update_icon()
	if (!dummy)
		animate_fade_in()

/obj/structure/corruption_node/Destroy()
	if (!dummy && SSnecromorph.marker && biomass_reclamation)
		SSnecromorph.marker.add_biomass_source(src, biomass*biomass_reclamation, reclamation_time, /datum/biomass_source/reclaim)

	.=..()


/obj/structure/corruption_node/update_icon()
	.=..()
	var/matrix/M = matrix()
	M = M.Scale(scale)	//We scale up the sprite so it slightly overlaps neighboring corruption tiles
	transform = M
	if (random_rotation)
		set_rotation()

/obj/structure/corruption_node/proc/set_rotation()
	var/matrix/M = matrix()
	var/rotation = pick(list(0,45,90,135,180,225,270,315))//Randomly rotate it
	cached_rotation += rotation
	transform = turn(M, rotation)

/obj/structure/corruption_node/proc/get_blurb()

/obj/structure/corruption_node/proc/get_long_description()
	.="<b>Health</b>: [max_health]<br>"
	if (biomass)
		.+="<b>Biomass</b>: [biomass]kg[biomass_reclamation ? " . If destroyed, reclaim [biomass_reclamation*100]% biomass over [reclamation_time/600] minutes" : ""]<br>"
	if (requires_corruption)
		.+= SPAN_WARNING("Must be placed on a corrupted tile <br>")
	.+= "<br><br>"
	.+= get_blurb()
	.+="<br><hr>"

