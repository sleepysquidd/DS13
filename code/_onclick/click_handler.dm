var/const/CLICK_HANDLER_NONE                 = 0
var/const/CLICK_HANDLER_REMOVE_ON_MOB_LOGOUT = 1
var/const/CLICK_HANDLER_ALL                  = (~0)

/*
	Custom click handling
*/

/mob
	var/datum/stack/click_handlers
	var/has_mousemove_click_handler = FALSE

/mob/Destroy()
	if(click_handlers)
		click_handlers.QdelClear()
		QDEL_NULL(click_handlers)
	. = ..()

//Called when click handlers are added or removed
/mob/proc/update_click_handler_flags()
	has_mousemove_click_handler = FALSE

	var/datum/stack/click_handlers

	click_handlers = src.GetClickHandlers()

	while (click_handlers.Num())
		var/datum/click_handler/CH = click_handlers.Pop()
		if (CH.has_mousemove)
			has_mousemove_click_handler = TRUE

/datum/click_handler
	var/mob/user
	var/flags = 0
	var/id	//Used by signal abilities
	var/cursor_override
	var/cached_cursor

	//Flags, used to optimise
	var/has_mousemove = FALSE

/datum/click_handler/New(var/mob/user)
	..()
	src.user = user
	if(flags & (CLICK_HANDLER_REMOVE_ON_MOB_LOGOUT))
		GLOB.logged_out_event.register(user, src, /datum/click_handler/proc/OnMobLogout)
	if (cursor_override && user.client)
		cached_cursor = user.client.mouse_pointer_icon
		user.client.mouse_pointer_icon = cursor_override

/datum/click_handler/Destroy()
	if(flags & (CLICK_HANDLER_REMOVE_ON_MOB_LOGOUT))
		GLOB.logged_out_event.unregister(user, src, /datum/click_handler/proc/OnMobLogout)
	if (cursor_override && user.client)
		user.client.mouse_pointer_icon = cached_cursor

	if (user)
		user.click_handlers.Remove(src)
	user = null
	. = ..()

/datum/click_handler/proc/Enter()
	return

/datum/click_handler/proc/Exit()
	return



/datum/click_handler/proc/OnMobLogout()
	user.RemoveClickHandler(src)

/datum/click_handler/proc/OnClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnMiddleClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnLeftClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnRightClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnDblClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnCtrlClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnAltClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnShiftClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnCtrlAltClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/OnCtrlShiftClick(var/atom/A, var/params)
	return TRUE

/datum/click_handler/proc/MouseDown(object,location,control,params)
	return TRUE

/datum/click_handler/proc/MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)
	return TRUE

/datum/click_handler/proc/MouseUp(object,location,control,params)
	return TRUE

/datum/click_handler/proc/MouseMove(object,location,control,params)
	return TRUE


/datum/click_handler/default/OnClick(var/atom/A, var/params)
	user.ClickOn(A, params)
	return TRUE

/datum/click_handler/default/OnDblClick(var/atom/A, var/params)
	user.DblClickOn(A, params)
	return TRUE

//Tests whether the target thing is valid, and returns it if so.
//If its not valid, null will be returned
//In the case of click catchers, we resolve and return the turf under it
/datum/click_handler/proc/resolve_world_target(var/a, var/params)
	if (params && user && user.client)
		var/b = user.client.resolve_drag(a, params)
		if (a != b)
			return b

	if (istype(a, /obj/screen/click_catcher))
		var/obj/screen/click_catcher/CC = a
		return CC.resolve(user)

	if (istype(a, /turf))
		return a

	else if (istype(a, /atom))
		var/atom/A = a
		if (istype(A.loc, /turf))
			return A
	return null


/mob/proc/GetClickHandler(var/datum/click_handler/popped_handler)
	if(!click_handlers)
		click_handlers = new()
	if(IS_EMPTY(click_handlers))
		PushClickHandler(/datum/click_handler/default)
	return click_handlers.Top()

/mob/proc/GetClickHandlerByType(var/required_type)
	var/datum/stack/CHL = GetClickHandlers()
	while (CHL.Num())
		var/datum/click_handler/CH = CHL.Pop()
		if (istype(CH, required_type))
			return CH

	return null


/mob/proc/GetClickHandlers()
	if(!click_handlers)
		click_handlers = new()
	if(IS_EMPTY(click_handlers.stack))
		PushClickHandler(/datum/click_handler/default)
	return click_handlers.Copy()

/mob/proc/RemoveClickHandler(var/datum/click_handler/click_handler)
	if(!click_handlers)
		return

	var/was_top = click_handlers.Top() == click_handler

	if(was_top)
		click_handler.Exit()
	click_handlers.Remove(click_handler)
	qdel(click_handler)

	update_click_handler_flags()

	if(!was_top)
		return
	click_handler = click_handlers.Top()
	if(click_handler)
		click_handler.Enter()

/mob/proc/RemoveClickHandlersByType(var/typepath)
	if(!click_handlers)
		return

	for (var/thing in click_handlers.stack)
		if (istype(thing, typepath))
			click_handlers.Remove(thing)
			qdel(thing)

/mob/proc/PopClickHandler()
	if(!click_handlers)
		return
	RemoveClickHandler(click_handlers.Top())

//Extra variables can be passed in here, and they will be propagated through to clickhandler /New
/mob/proc/PushClickHandler(var/datum/click_handler/new_click_handler_type)
	var/list/newarguments = list(src)
	if (length(args) > 1)
		newarguments = newarguments + args.Copy(2)

	if((initial(new_click_handler_type.flags) & CLICK_HANDLER_REMOVE_ON_MOB_LOGOUT) && !client)
		return FALSE
	if(!click_handlers)
		click_handlers = new()
	var/datum/click_handler/click_handler = click_handlers.Top()
	if(click_handler)
		click_handler.Exit()

	click_handler = new new_click_handler_type(arglist(newarguments))
	click_handler.Enter()
	click_handlers.Push(click_handler)

	update_click_handler_flags()

	return click_handler









/****************************
	Full auto gunfire
*****************************/
/datum/click_handler/fullauto
	var/atom/target = null
	var/firing = FALSE
	var/obj/item/weapon/gun/reciever //The thing we send firing signals to.
	//Todo: Make this work with callbacks
	var/minimum_shots = 0
	var/shots_fired = 0

	var/user_trying_to_fire = FALSE



/datum/click_handler/fullauto/proc/start_firing()
	if (!firing)
		firing = TRUE
		shots_fired = 0
		while (firing && target)
			if (can_stop_firing())
				break
			do_fire()
			sleep(0.5) //Keep spamming events every frame as long as the button is held
		stop_firing()

//Next loop will notice these vars and stop shooting
/datum/click_handler/fullauto/proc/stop_firing()
	firing = FALSE
	target = null

/datum/click_handler/fullauto/proc/do_fire()
	if (reciever.afterattack(target, user, FALSE))
		shots_fired++

/datum/click_handler/fullauto/MouseDown(object,location,control,params)
	var/list/modifiers = params2list(params)
	if(modifiers["left"])
		object = resolve_world_target(object, params)
		if (object)
			target = object
			user.face_atom(target)
			user_trying_to_fire = TRUE
			spawn()
				start_firing()
			return FALSE
	return TRUE

//In the case of drag events we should always return true, incase there are multiple drag handlers in the sta
/datum/click_handler/fullauto/MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)
	over_object = resolve_world_target(over_object, params)
	if (over_object && firing)
		target = over_object
		user.face_atom(target)
	return TRUE

/datum/click_handler/fullauto/MouseUp(object,location,control,params)
	var/list/modifiers = params2list(params)
	if(modifiers["left"])
		user_trying_to_fire = FALSE	//When we release the button, stop attempting to fire. it may still go if there's minimum shots remaining
	return TRUE

/datum/click_handler/fullauto/Destroy()
	stop_firing()//Without this it keeps firing in an infinite loop when deleted
	.=..()


/datum/click_handler/fullauto/proc/can_stop_firing()
	if (!reciever || !reciever.can_ever_fire())	//If the gun loses the ability to fire, we stop immediately
		return TRUE

	//If the user is still holding down the button, keep going
	if (user_trying_to_fire)
		return FALSE

	//If we haven't fired the minimum yet, we may be forced to continue. But only if the gun is in condition to do so
	if (minimum_shots && (shots_fired < minimum_shots))
		return FALSE

	return TRUE







/****************************
	Sustained Fire
*****************************/
/datum/click_handler/sustained
//Useful for ripper and maybe tracking lasers. Works similar to full auto, but:
	//Constant firing events are not generated
	//Firing events are generated on every mousedrag
	var/atom/target = null
	var/firing = FALSE
	var/obj/item/weapon/gun/reciever //The thing we send firing signals to.
	var/last_params
	//Todo: Make this work with callbacks

	has_mousemove = TRUE

/datum/click_handler/sustained/proc/start_firing()

	if (reciever && istype(reciever.loc, /mob))
		GLOB.moved_event.register(reciever.loc, reciever, /obj/item/weapon/gun/proc/user_moved)
	do_fire()
	firing = reciever.firing

//Next loop will notice these vars and stop shooting
/datum/click_handler/sustained/proc/stop_firing()
	if (firing)
		if (reciever && istype(reciever.loc, /mob))
			GLOB.moved_event.unregister(reciever.loc, reciever, /obj/item/weapon/gun/proc/user_moved)
		firing = FALSE
		target = null
		reciever.stop_firing()

/datum/click_handler/sustained/proc/do_fire()
	reciever.afterattack(target, user, FALSE, last_params, get_global_pixel_click_location(last_params, user ? user.client : null))

/datum/click_handler/sustained/MouseDown(object,location,control,params)
	last_params = params
	object = resolve_world_target(object, params)
	if (object)
		target = object
		user.face_atom(target)
		start_firing()
		return FALSE
	return TRUE

/datum/click_handler/sustained/MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)
	last_params = params
	over_object = resolve_world_target(over_object, params)
	if (over_object && firing)
		target = over_object //This var contains the thing the user is hovering over, oddly
		user.face_atom(target)
		do_fire()
		return FALSE
	return TRUE

/datum/click_handler/sustained/MouseMove(object,location,control,params)
	last_params = params
	object = resolve_world_target(object, params)
	if (object && firing)
		target = location //This var contains the thing the user is hovering over, oddly
		user.face_atom(target)
		do_fire()
		return FALSE
	return TRUE


/datum/click_handler/sustained/MouseUp(object,location,control,params)
	stop_firing()
	return TRUE

/datum/click_handler/sustained/Destroy()
	stop_firing()//Without this it keeps firing in an infinite loop when deleted
	.=..()




/****************************
	Modclick Verbs
*****************************/
/*
A generic container for verbs triggered on various modified clicks
Verbs added this way will recieve the target as their first parameter. and click params as their second
Each proc expected to handle this and return true or false to indicate whether or not they will take this click.

Use add_modclick_verb to add a verb,
*/
/datum/click_handler/modifier
	var/list/verbs = list()


//We call each callback in our verbs list. If it returns true, we return false to terminate the click
/datum/click_handler/modifier/proc/handle_click(var/atom/A, var/params)
	for (var/datum/callback/C in verbs)
		if (C.Invoke(A, params))
			return FALSE
	return TRUE





//Specific types
//----------------------------------------
/datum/click_handler/modifier/alt/OnAltClick(var/atom/A, var/params)
	return handle_click(A, params)

/datum/click_handler/modifier/ctrl/OnCtrlClick(var/atom/A, var/params)
	return handle_click(A, params)

/datum/click_handler/modifier/shift/OnShiftClick(var/atom/A, var/params)
	return handle_click(A, params)

/datum/click_handler/modifier/middle/OnMiddleClick(var/atom/A, var/params)
	return handle_click(A, params)

/datum/click_handler/modifier/ctrlalt/OnCtrlAltClick(var/atom/A, var/params)
	return handle_click(A, params)

/datum/click_handler/modifier/ctrlshift/OnCtrlShiftClick(var/atom/A, var/params)
	return handle_click(A, params)



/*
	Adds an altclick verb to the specified datum
*/
/mob/proc/add_modclick_verb(var/keytype, var/function, var/priority, var/list/extra_args)
	//Firstly, lets find or create an altclick verb handler on this mob
	var/datum/click_handler/modifier/CHM = GetClickHandlerByType(keytype)
	if (!CHM)
		CHM = PushClickHandler(keytype)

	//Next we create a callback, which points to the mob, proc to call, and the arguments to pass to it
	var/list/newargs = list(src, function)
	if (extra_args)
		newargs.Add(extra_args)
	var/datum/callback/C = CALLBACK(arglist(newargs))

	if (!isnum(priority))
		priority = 1
	//Add it to the verbs list
	CHM.verbs[C] = priority

	//And sort that list
	CHM.verbs = sortTim(CHM.verbs, cmp=/proc/cmp_numeric_dsc, associative = TRUE)


//Removing by type.
/mob/proc/remove_modclick_verb(var/keytype, var/function)
	var/datum/click_handler/modifier/CHM = GetClickHandlerByType(keytype)
	if (!CHM)
		return

	for (var/datum/callback/C in CHM.verbs)
		if (C.delegate == function)
			CHM.verbs.Remove(C)