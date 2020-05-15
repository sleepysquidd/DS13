// Chaos cake

/datum/recipe/chaoscake_layerone
	reagents = list(/datum/reagent/nutriment/flour = 30,/datum/reagent/drink/milk = 20, /datum/reagent/sugar = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/meat/,
			/obj/item/weapon/reagent_containers/food/snacks/meat/,
			/obj/item/weapon/reagent_containers/food/snacks/meat/,
			/obj/item/weapon/reagent_containers/food/snacks/meat/,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/structure/chaoscake

/datum/recipe/chaoscake_layertwo
	reagents = list(/datum/reagent/nutriment/flour = 30, /datum/reagent/drink/milk = 20, /datum/reagent/sugar = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer

/datum/recipe/chaoscake_layerthree
	reagents = list(/datum/reagent/nutriment/flour = 25, /datum/reagent/drink/milk = 15, /datum/reagent/sugar = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer/three

/datum/recipe/chaoscake_layerfour
	reagents = list(/datum/reagent/nutriment/flour = 25, /datum/reagent/drink/milk = 15, /datum/reagent/sugar = 10, /datum/reagent/drink/milkshake = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer/four

/datum/recipe/chaoscake_layerfive
	reagents = list(/datum/reagent/nutriment/flour = 20, /datum/reagent/drink/milk = 10, /datum/reagent/sugar = 10, /datum/reagent/blood = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/lobster,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer/five

/datum/recipe/chaoscake_layersix
	reagents = list(/datum/reagent/nutriment/flour = 20, /datum/reagent/drink/milk = 10, /datum/reagent/sugar = 10, /datum/reagent/nutriment/sprinkles = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/chocolatebar,
			/obj/item/weapon/reagent_containers/food/snacks/chocolatebar,
			/obj/item/weapon/reagent_containers/food/snacks/chocolatebar,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer/six

/datum/recipe/chaoscake_layerseven
	reagents = list(/datum/reagent/nutriment/flour = 15, /datum/reagent/drink/milk = 5, /datum/reagent/sugar = 5, /datum/reagent/ethanol/devilskiss = 10)
	fruit = list()
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer/seven

/datum/recipe/chaoscake_layereight
	reagents = list(/datum/reagent/nutriment/flour = 15, /datum/reagent/drink/milk = 5, /datum/reagent/sugar = 5, /datum/reagent/drink/milk/cream = 10)
	fruit = list("lemon" = 1)
	items = list(
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/dough,
			/obj/item/weapon/reagent_containers/food/snacks/egg
		)
	result = /obj/item/weapon/chaoscake_layer/eight

/datum/recipe/chaoscake_layernine
	reagents = list(/datum/reagent/water = 10, /datum/reagent/blood = 10)
	fruit = list()
	items = list()
	result = /obj/item/weapon/chaoscake_layer/nine

/obj/structure/chaoscake
	name = "An unfinished cake"
	desc = "A single layer of a strange cake, you can see the cherry paste ooze, but it feels very incomplete..."

	icon = 'icons/obj/food64x64.dmi'
	icon_state = "chaoscake_unfinished-1"
	pixel_x = -16

	var/slices = 6
	var/maxslices = 6
	var/stage = 1
	var/maxstages = 9
	var/edible = 0

	var/regentime = 1000
	var/interval = 0

	var/static/list/desclist2 = list(
			"The first layer of a strange cake, you can see the cherry paste ooze.",
			"The second layer of the cake sits in place now, smelling of pear with delicious colourful cream.",
			"The third layer of cake adds a strange purple layer, glazed over with frosting. It smells of grapes, but with a hint of something foul underneath.",
			"With the fourth layer added the cake looks happier again. Reeking of vanilla, it brings up memories of childhood joy.",
			"The fifth layer is extremely disturbing on that cake. Smelling of pure copper, it seems that bright blood clots are forming on top.",
			"The cake is getting closer with the sixth layer added, the pink hue smelling of chocolate, with colourful sprinkles on top.",
			"The first pair of triplets rest on the cake, despite being mostly similar to the first three, an evil aura becomes noticable.",
			"The second pair of triplets rest on the cake, if you stand on the bright side, you can feel a good aura lifting your mood.",
			"A chaos cake. Both a creation of dark and light, the two cakes are kept in a careful balance by that mystical coin in the middle. It's said its effects would dissipate if the balance is ever tipped in favour of one side too much, so both sides much be cut equally."
		)

/obj/item/weapon/chaoscake_layer
	name = "A layer of cake"
	desc = "a layer of cake, it is made out of colourful cream."
	icon = 'icons/obj/food.dmi'
	icon_state = "chaoscake_layer-2"
	var/layer_stage = 1

/obj/item/weapon/chaoscake_layer/three
	desc = "a layer of cake, glazed in purple."
	icon_state = "chaoscake_layer-3"
	layer_stage = 2

/obj/item/weapon/chaoscake_layer/four
	desc = "a layer of cake, reminding you of a colouring book."
	icon_state = "chaoscake_layer-4"
	layer_stage = 3

/obj/item/weapon/chaoscake_layer/five
	desc = "A layer of cake, smells like copper."
	icon_state = "chaoscake_layer-5"
	layer_stage = 4

/obj/item/weapon/chaoscake_layer/six
	desc = "A layer of cake, featuring colourful sprinkles."
	icon_state = "chaoscake_layer-6"
	layer_stage = 5

/obj/item/weapon/chaoscake_layer/seven
	desc = "A triplet of evil cake parts."
	icon_state = "chaoscake_layer-7"
	layer_stage = 6

/obj/item/weapon/chaoscake_layer/eight
	desc = "A triplet of good cake parts."
	icon_state = "chaoscake_layer-8"
	layer_stage = 7

/obj/item/weapon/chaoscake_layer/nine
	name = "A coin of balance"
	desc = "A very peculiar coin, it seems to stabilise the air around it."
	icon_state = "chaoscake_layer-9"
	layer_stage = 8

/obj/structure/chaoscake/proc/HasSliceMissing()
	..()
	if(slices < maxslices)
		if(interval >= regentime)
			interval = 0
			slices++
			HasSliceMissing()
		else
			interval++
			HasSliceMissing()
	else
		return

/obj/item/weapon/reagent_containers/food/snacks/chaoscakeslice
	name = "The Chaos Cake Slice"
	desc = "A slice from The Chaos Cake, it pulses weirdly, as if angry to be seperated from the whole"
	icon_state = "chaoscake_slice-1"

	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list()
	nutriment_amt = 4
	volume = 80

/obj/item/weapon/reagent_containers/food/snacks/chaoscakeslice/New()
	..()
	var/i = rand(1,6)
	icon_state = "chaoscake_slice-[i]"
	switch(i)
		if(1)
			name = "Slice Of Evil" //Pretty damn poisonous, takes a lot of work to make safe for consumption, useful for medical.
			desc = "An odd slice, despite the grease and cherries oozing off the top, it smells delicious."
			nutriment_desc = list("The desire to consume" = 10) // You won't even taste the poison.
			reagents.add_reagent(/datum/reagent/toxin, 2)
			reagents.add_reagent(/datum/reagent/toxin/plasticide, 2)
			reagents.add_reagent(/datum/reagent/toxin/amatoxin, 2)
			reagents.add_reagent(/datum/reagent/toxin/carpotoxin, 2)
			reagents.add_reagent(/datum/reagent/toxin/phoron, 2)
			bitesize = 7
		if(2)
			name = "Slice Of Evil" //A bad trip
			desc = "A mysterious slice, coated in purple frosting that smells like grapes."
			nutriment_desc = list("The desire to show off an party" = 10)
			reagents.add_reagent(/datum/reagent/soporific, 2)
			reagents.add_reagent(/datum/reagent/space_drugs, 10)
			reagents.add_reagent(/datum/reagent/serotrotium, 4)
			reagents.add_reagent(/datum/reagent/cryptobiolin, 8)
			reagents.add_reagent(/datum/reagent/mindbreaker, 10)
			reagents.add_reagent(/datum/reagent/psilocybin, 10)
			bitesize = 30 //even a single bite won't make you escape fate.
		if(3)
			name = "Slice Of Evil" //acidic
			desc = "A menacing slice, smelling clearly of copper, blood clots float on top."
			nutriment_desc = list("Infernal Rage" = 10)
			reagents.add_reagent(/datum/reagent/blood, 20)
			reagents.add_reagent(/datum/reagent/acid/necromorph, 10)
			reagents.add_reagent(/datum/reagent/mutagen, 4)
			reagents.add_reagent(/datum/reagent/ethanol/thirteenloko, 20)
			reagents.add_reagent(/datum/reagent/hyperzine, 10)
			bitesize = 30
		if(4)
			name = "Slice Of Good" //anti-tox
			desc = "A colourful slice, smelling of pear and coated in delicious cream."
			nutriment_desc = list("Hapiness" = 10)
			reagents.add_reagent(/datum/reagent/dylovene, 2)
			reagents.add_reagent(/datum/reagent/tricordrazine, 2)
			bitesize = 3
		if(5)
			name = "Slice Of Good" //anti-oxy
			desc = "A light slice, it's pretty to look at and smells of vanilla."
			nutriment_desc = list("Freedom" = 10)
			reagents.add_reagent(/datum/reagent/dexalinp, 2)
			reagents.add_reagent(/datum/reagent/tricordrazine, 2)
			bitesize = 3
		if(6)
			name = "Slice Of Good" //anti-burn/brute
			desc = "A hearty slice, it smells of chocolate and strawberries."
			nutriment_desc = list("Love" = 10)
			reagents.add_reagent(/datum/reagent/bicaridine, 2)
			reagents.add_reagent(/datum/reagent/tricordrazine, 2)
			reagents.add_reagent(/datum/reagent/kelotane, 2)
			bitesize = 4

/obj/structure/chaoscake/attackby(var/obj/item/weapon/W, var/mob/living/user)
	if(istype(W,/obj/item/weapon/material/knife))
		if(edible == 1)
			HasSliceMissing()
			if(slices <= 0)
				user << "The cake hums away quietly as the chaos powered goodness slowly recovers the large amount of lost mass, best to give it a moment before cutting another slice."
				return
			else
				user << "You cut a slice of the cake. The slice looks like the cake was just baked, and you can see before your eyes as the spot where you cut the slice slowly regenerates!"
				slices = slices - 1
				// icon_state = "chaoscake-[slices]" - doesn't work properly yet, will fix later
				new /obj/item/weapon/reagent_containers/food/snacks/chaoscakeslice(src.loc)

		else
			to_chat(user, "<span class='notice'>It looks so good... But it feels so wrong to eat it before it's finished...</span>")
			return
	if(istype(W,/obj/item/weapon/chaoscake_layer))
		var/obj/item/weapon/chaoscake_layer/C = W
		if(C.layer_stage == 8)
			user << "Finally! The coin on the top, the almighty chaos cake is complete!"
			qdel(W)
			stage++
			desc = desclist2[stage]
			icon_state = "chaoscake-6"
			edible = 1
			name = "The Chaos Cake!"
		else if(stage == maxstages)
			user << "The cake is already done!"
		else if(stage == C.layer_stage)
			user << "You add another layer to the cake, nice."
			qdel(W)
			stage++
			desc = desclist2[stage]
			icon_state = "chaoscake_unfinished-[stage]"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"

/obj/structure/chaoscake/update_icon()
	icon_state = "chaoscake_stage-[stage]"