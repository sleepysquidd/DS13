//Procs to check if a target atom can be reached from the current. Essentially raytracing

//Helper proc to check if you can hit them or not.
/proc/check_trajectory(atom/target as mob|obj, atom/firer as mob|obj, var/pass_flags=PASS_FLAG_TABLE|PASS_FLAG_GLASS|PASS_FLAG_GRILLE, item_flags = null, obj_flags = null)
	if(!istype(target) || !istype(firer))
		return 0

	//If its in the same turf, just say yes
	if (get_turf(target) == get_turf(firer))
		return TRUE




	var/obj/item/projectile/test/trace = new /obj/item/projectile/test(get_turf(firer)) //Making the test....
	//Set the flags and pass flags to that of the real projectile...
	if(!isnull(item_flags))
		trace.item_flags = item_flags
	if(!isnull(obj_flags))
		trace.obj_flags = obj_flags
	trace.pass_flags = pass_flags

	var/output = trace.launch(target) //Test it!
	qdel(trace) //No need for it anymore
	return output //Send it back to the gun!





//Version optimised for mass testing
/proc/check_trajectory_mass(var/list/targets, atom/firer as mob|obj, var/pass_flags=PASS_FLAG_TABLE|PASS_FLAG_GLASS|PASS_FLAG_GRILLE, item_flags = null, obj_flags = null, var/allow_sleep = FALSE)
	if(!istype(firer))
		return 0

	var/turf/origin = get_turf(firer)
	var/obj/item/projectile/test/trace = new /obj/item/projectile/test(origin) //Making the test....

	//Set the flags and pass flags to that of the real projectile...
	if(!isnull(item_flags))
		trace.item_flags = item_flags
	if(!isnull(obj_flags))
		trace.obj_flags = obj_flags
	trace.pass_flags = pass_flags

	for (var/atom/A as anything in targets)
		if (allow_sleep)
			CHECK_TICK
		trace.result = null
		trace.loc = origin
		targets[A] = trace.launch(A) //Test it!
	qdel(trace) //No need for it anymore
	return targets //Send it back to the gun!



//"Tracing" projectile
/obj/item/projectile/test //Used to see if you can hit them.
	invisibility = 101 //Nope!  Can't see me!
	yo = null
	xo = null
	var/result = null //To pass the message back to the gun.

/obj/item/projectile/test/Bump(atom/A as mob|obj|turf|area)
	if(A == firer)
		last_loc = loc
		loc = A.loc
		return //cannot shoot yourself
	if(istype(A, /obj/item/projectile))
		return
	if(A == original)
		result = TRUE
		return
	result = FALSE
	return

/obj/item/projectile/test/launch(atom/target)
	var/turf/curloc = get_turf(src)
	var/turf/targloc = get_turf(target)
	if(!curloc || !targloc)
		return FALSE

	if (curloc == targloc)
		return TRUE

	original = target

	//plot the initial trajectory
	setup_trajectory(curloc, targloc)
	return Process(targloc)

/obj/item/projectile/test/Process(var/turf/targloc)
	while(src) //Loop on through!
		if(!isnull(result))
			return result
		if((!( targloc ) || loc == targloc))
			targloc = locate(min(max(x + xo, 1), world.maxx), min(max(y + yo, 1), world.maxy), z) //Finding the target turf at map edge

		trajectory.increment()	// increment the current location
		location = trajectory.return_location(location)		// update the locally stored location data

		//TODO: Figure out why this happens
		if (!location)
			return FALSE

		Move(location.return_turf())


		var/turf/T = get_turf(src)
		if (T == original)
			return TRUE

		var/atom/A = locate(original) in T
		if(A) //We are on our target's turf, we can hit them
			return TRUE