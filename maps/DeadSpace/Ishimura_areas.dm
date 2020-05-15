//Ishimura Areas// (If you add or change areas, make sure they are in alphabetical order; only exceptions are /upper and /lower - Snype)
/area/ishimura
	icon = 'maps/DeadSpace/ishimura_areas.dmi'

/area/ishimura/hull
	name = "\improper Ishimura Hull"

/area/supply/dock
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0

// Thunderdome

/area/tdome
	name = "\improper Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	dynamic_lighting = 0
	sound_env = ARENA

/area/tdome/tdome1
	name = "\improper Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "\improper Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "\improper Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "\improper Thunderdome (Observer.)"
	icon_state = "purple"

//---------------------------------------------------UPPER--AREAS---------------------------------------------------//
/area/ishimura/upper
	name = "\improper Upper Deck"

//------------------Command - Upper------------------//
/area/ishimura/upper/command
	name = "\improper Command"
	icon_state = "commandbase"

/area/ishimura/upper/command/bridge
	name = "\improper Bridge"
	icon_state = "ishimurabridge"

/area/ishimura/upper/command/captain_area
	name = "\improper Captain's Station"
	icon_state = "c_station"

//------------------Engineering - Upper------------------//
/area/ishimura/upper/engineering
	name = "\improper Engineering"
	icon_state = "engibase"

/area/ishimura/upper/engineering/atmospherics
	name = "\improper Atmospherics"
	icon_state = "atmos"

/area/ishimura/upper/engineering/atmospherics/storage
	name = "\improper Spare Tank Storage"

/area/ishimura/upper/engineering/bay
	name = "\improper Engineering Bay"
	icon_state = "engi_bay"

/area/ishimura/upper/engineering/breakroom
	name = "\improper Engineering Breakroom"

/area/ishimura/upper/engineering/chief_office
	name = "\improper Chief Engineer's Office"

/area/ishimura/upper/engineering/engine_room
	name = "\improper Engine Room"
	icon_state = "engine"

/area/ishimura/upper/engineering/engine_room/airlock_one
	name = "\improper Engine Airlock One"

/area/ishimura/upper/engineering/engine_room/airlock_two
	name = "\improper Engine Airlock Two"

/area/ishimura/upper/engineering/engine_smes
	name = "\improper Engine SMES Room"

/area/ishimura/upper/engineering/lobby
	name = "\improper Engineering Lobby"

/area/ishimura/upper/engineering/machining_room
	name = "\improper Machining Room"

/area/ishimura/upper/engineering/spare_storage
	name = "\improper Machining Room Storage"
	icon_state = "storage"

/area/ishimura/upper/engineering/spare_storage/port
	name = "\improper Upper Deck Port Power Storage"

/area/ishimura/upper/engineering/spare_storage/starboard
	name = "\improper Upper Deck Starboard Power Storage"

/area/ishimura/upper/engineering/spare_storage/tool
	name = "\improper Upper Deck Tool Storage"

/area/ishimura/upper/engineering/monitoring_room
	name = "\improper Engine Monitoring Room"

/area/ishimura/upper/engineering/prep
	name = "\improper Engineer Equipment Prep"

/area/ishimura/upper/engineering/tcomms
	name = "\improper Telecommunications"
	icon_state = "t_comm"

/area/ishimura/upper/engineering/tcomms/control
	name = "\improper Telecommunications Control Room"
	icon_state = "t_comm_control"

/area/ishimura/upper/engineering/waste_tank_room
	name = "\improper Waste Tank Temporary Storage"

//------------------Escape Vehicles - Upper------------------//
/area/shuttle/escape_pod1/station
	name = "Escape Pod One"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod2/station
	name = "Escape Pod Two"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod3/station
	name = "Escape Pod Three"
	area_flags = AREA_FLAG_RAD_SHIELDED


//------------------Maintenance - Upper------------------//
/area/ishimura/upper/maintenance
	name = "\improper Maintenance"
	icon_state = "maintbase"

/area/ishimura/upper/maintenance/aft_port
	name = "\improper Upper Deck Aft-Port Maintenance"

/area/ishimura/upper/maintenance/aft_starboard
	name = "\improper Upper Deck Aft-Starboard Maintenance"

/area/ishimura/upper/maintenance/central
	name = "\improper Upper Deck Central Maintenance"

/area/ishimura/upper/maintenance/fore_central
	name = "\improper Upper Deck Fore-Central Maintenance"

/area/ishimura/upper/maintenance/fore_port
	name = "\improper Upper Deck Fore-Port Maintenance"

/area/ishimura/upper/maintenance/fore_starboard
	name = "\improper Upper Deck Fore-Starboard Maintenance"

//------------------Medical & Research------------------//
/area/ishimura/upper/medical
	name = "\improper Clinic"
	icon_state = "medicalbase"

/area/ishimura/upper/medical/senior_medical_office
	name = "\improper Senior Medical Officer's Office"

/area/ishimura/upper/medical/lobby
	name = "\improper Clinic Waiting Room"

/area/ishimura/upper/medical/lobby/reception
	name = "\improper Clinic Reception"

/area/ishimura/upper/medical/lockeroom
	name = "\improper Changing Room"

/area/ishimura/upper/medical/morgue
	name = "\improper Morgue"
	icon_state = "morgue"

/area/ishimura/upper/medical/morgue/autopsy
	name = "\improper Autopsy Room"

/area/ishimura/upper/medical/supply_storage
	name = "\improper Supply Storage"
	icon_state = "med_storage"

/area/ishimura/upper/medical/surgery
	name = "\improper Surgery"

/area/ishimura/upper/medical/surgery/one
	name = "\improper Surgical Suite One"
	icon_state = "surgery_one"

/area/ishimura/upper/medical/surgery/two
	name = "\improper Surgical Suite Two"
	icon_state = "surgery_two"

/area/ishimura/upper/research
	name = "\improper Research Wing"
	icon_state = "researchbase"

/area/ishimura/upper/research/chemistry
	name = "\improper Chemistry Lab"

/*area/ishimura/upper/research/bpc
	name = "\improper Biological Prosthetics Center"
*/

/area/ishimura/upper/research/biolab
	name = "\improper Biolab"

/area/ishimura/upper/research/chief_science_office
	name = "\improper Chief Science Officer Office"

/area/ishimura/upper/research/storage
	name = "\improper Research Supply Storage"

/area/ishimura/upper/research/virology
	name = "\improper Virology"

/area/ishimura/upper/research/virology/entrance
	name = "\improper Virology Airlock"

/area/ishimura/upper/research/virology/quarantine
	name = "\improper Quarantine Suite"

//------------------Misc - Upper------------------//
/area/ishimura/upper/misc
	name = "\improper Misc"
	icon_state = "miscbase"

/area/ishimura/upper/misc/bathroom
	name = "\improper Upper Deck Bathroom"

/area/ishimura/upper/misc/breakroom
	name = "\improper Upper Deck Breakroom"

/area/ishimura/upper/misc/escape
	name = "\improper Escape Wing"

/area/ishimura/upper/misc/hallway
	name = "\improper Hallway"

/area/ishimura/upper/misc/hallway/aft
	name = "\improper Upper Deck Aft Hallway"

/area/ishimura/upper/misc/hallway/bridge
	name = "\improper Bridge Hallway"

/area/ishimura/upper/misc/hallway/central
	name = "\improper Upper Deck Central Hallway"

/area/ishimura/upper/misc/hallway/escape
	name = "\improper Upper Deck Escape Hallway"

/area/ishimura/upper/misc/hallway/fore
	name = "\improper Upper Deck Fore Hallway"

/area/ishimura/upper/misc/hallway/hangar
	name = "\improper Hangar Hallway"

/area/ishimura/upper/misc/hangar
	name = "\improper Ishimura Hangar"

/area/ishimura/upper/misc/hangar/reception
	name = "\improper Hangar Reception Lobby"

/area/ishimura/upper/misc/janitorcloset
	name = "\improper Janitorial Closet"

/area/ishimura/upper/misc/janitorcloset/aft
	name = "\improper Aft Janitorial Closet"

/area/ishimura/upper/misc/janitorcloset/fore_port
	name = "\improper Fore-Port Janitorial Closet"

/area/ishimura/upper/misc/janitorcloset/fore_starboard
	name = "\improper Fore-Starboard Janitorial Closet"

//------------------Security - Upper------------------//
/area/ishimura/upper/security
	name = "\improper Security"
	icon_state = "securitybase"

/area/ishimura/upper/security/armory
	name = "\improper Main Armory"

/area/ishimura/upper/security/brig
	name = "\improper Brig"
	icon_state = "brig"

/area/ishimura/upper/security/checkpoint
	name = "\improper Security Entrance"
	icon_state = "checkpoint"

/area/ishimura/upper/security/checkpoint/bridge
	name = "\improper Bridge Security Station"

/area/ishimura/upper/security/checkpoint/engineering
	name = "\improper Engineering Security Station"

/area/ishimura/upper/security/checkpoint/hangar
	name = "\improper Hangar Security Station"

/area/ishimura/upper/security/checkpoint/ladders
	name = "\improper Main Ladder Security Station"

/area/ishimura/upper/security/checkpoint/medical
	name = "\improper Medical Security Station"

/area/ishimura/upper/security/chiefsoffice
	name = "\improper Chief Security Officer's Office"

/area/ishimura/upper/security/cryo
	name = "\improper Cyrogenic Isolation"

/area/ishimura/upper/security/evidence
	name = "\improper Evidence Storage"

/area/ishimura/upper/security/forensics
	name = "\improper Forensics Lab"

/area/ishimura/upper/security/isolation
	name = "\improper Isolation"

//---------------------------------------------------LOWER--AREAS---------------------------------------------------//
/area/ishimura/lower
	name = "\improper Lower Deck"

//------------------Cargo------------------//
/area/ishimura/lower/cargo
	name = "\improper Cargo"
	icon_state = "cargobase"

/area/ishimura/lower/cargo/bay
	name = "\improper Cargo Bay"
	icon_state = "cargobay"

/area/ishimura/lower/cargo/disposals
	name = "\improper Disposals"
	icon_state = "disposals"

/area/ishimura/lower/cargo/lobby
	name = "\improper Cargo Reception"
	icon_state = "cargolbby"

/area/ishimura/lower/cargo/storage
	name = "\improper Warehouse"
	icon_state = "cargostorage"

/area/ishimura/lower/cargo/supply_office
	name = "\improper Supply Office"
	icon_state = "cargoffice"

//------------------Crew------------------//
/area/ishimura/lower/crew
	name = "\improper Crew Deck"
	icon_state = "crewbase"

/area/ishimura/lower/crew/cryo
	name = "\improper Cryo"

/area/ishimura/lower/crew/gym
	name = "\improper Gym"

/area/ishimura/lower/crew/messhall
	name = "\improper Messhall"

/area/ishimura/lower/crew/messhall/bar
	name = "\improper Bar"

/area/ishimura/lower/crew/messhall/bar/quarters
	name = "\improper Bartender's Quarters"

/area/ishimura/lower/crew/messhall/executive
	name = "\improper Executive Mess"

/area/ishimura/lower/crew/messhall/kitchen
	name = "\improper Kitchen"

/area/ishimura/lower/crew/messhall/kitchen/freezer
	name = "\improper Freezer"

/area/ishimura/lower/crew/messhall/kitchen/freezer/executive
	name = "\improper Executive Freezer"

/area/ishimura/lower/crew/sleepblock
	name = "\improper Sleep Block"

/area/ishimura/lower/crew/sleepblock/a
	name = "\improper Sleep Block A"

/area/ishimura/lower/crew/sleepblock/b
	name = "\improper Sleep Block B"

/area/ishimura/lower/crew/sleepblock/c
	name = "\improper Sleep Block C"

/area/ishimura/lower/crew/sleepblock/executive
	name = "\improper Executive Sleep Block"

/area/ishimura/lower/crew/sleepblock/executive/quarters
	name = "\improper Executive Quarters"

/area/ishimura/lower/crew/sleepblock/executive/quarters/first_lieutenant
	name = "\improper First Lieutenant's Quarters"

/area/ishimura/lower/crew/sleepblock/executive/quarters/captain
	name = "\improper Captain's Quarters"

/area/ishimura/lower/crew/sleepblock/executive/quarters/bridge_officers
	name = "\improper Bridge Officer's Quarters"

/area/ishimura/lower/crew/sleepblock/commons
	name = "\improper Sleep Block Commons"

/area/ishimura/lower/crew/sleepblock/commons/executive
	name = "\improper Executive Quarters"

//------------------Engineering - Lower------------------//
/area/ishimura/lower/engineering
	name = "\improper Lower Engineeering"
	icon_state = "engibase"

/area/ishimura/lower/engineering/airlock
	name = "\improper Airlock"

/area/ishimura/lower/engineering/airlock/one
	name = "\improper Engineering Airlock Maintenance One"

/area/ishimura/lower/engineering/airlock/two
	name = "\improper Engineering Airlock Maintenance Two"

/area/ishimura/lower/engineering/bay
	name = "\improper Lower Engineering Bay"
	icon_state = "low_engi_bay"

/area/ishimura/lower/engineering/storage_closet
	name = "\improper Storage"
	icon_state = "storage"

/area/ishimura/lower/engineering/storage_closet/air
	name = "\improper Spare Air Circulation Storage"
	icon_state = "starboard_engistore"

/area/ishimura/lower/engineering/storage_closet/battery
	name = "\improper Spare Battery Storage"
	icon_state = "battery_storage"

/area/ishimura/lower/engineering/storage_closet/electronics
	name = "\improper Electronic Parts Storage"
	icon_state = "electronics_storage"

/area/ishimura/lower/engineering/storage_closet/fore
	name = "\improper Fore Parts Storage"

/area/ishimura/lower/engineering/storage_closet/midship
	name = "\improper Midship Parts Storage"

/area/ishimura/lower/engineering/storage_closet/paint
	name = "\improper Paint Storage"

/area/ishimura/lower/engineering/substation/crew
	name = "\improper Crew Quarters Substation"
	icon_state = "crew_engistation"

/area/ishimura/lower/engineering/substation/port
	name = "\improper Lower Engineering Port Substation"
	icon_state = "port_engistation"

//------------------Escape Vehicles - Lower------------------//
//Pods

/area/shuttle/escape_pod4/station
	name = "Escape Pod Four"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod5/station
	name = "Escape Pod Five"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod6/station
	name = "Escape Pod Six"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod7/station
	name = "Escape Pod Seven"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod8/station
	name = "Escape Pod Eight"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/shuttle/escape_pod9/station
	name = "Escape Pod Nine"
	area_flags = AREA_FLAG_RAD_SHIELDED

//------------------Maintenance------------------//
/area/ishimura/lower/maintenance
	name = "\improper Maintenance"
	icon_state = "maintbase"

/area/ishimura/lower/maintenance/aft_central
	name = "\improper Lower Deck Aft-Central Maintenance"

/area/ishimura/lower/maintenance/aft_port
	name = "\improper Lower Deck Aft-Port Maintenance"

/area/ishimura/lower/maintenance/aft_starboard
	name = "\improper Lower Deck Aft-Starboard Maintenance"

/area/ishimura/lower/maintenance/engineering
	name = "\improper Lower Deck Engineering-Port Maintenance"

/area/ishimura/lower/maintenance/fore_central
	name = "\improper Lower Deck Fore-Central Maintenance"

/area/ishimura/lower/maintenance/fore_starboard
	name = "\improper Lower Deck Fore-Starboard Maintenance"

/area/ishimura/lower/maintenance/messhall
	name = "\improper Messhall Maintenance"

/area/ishimura/lower/maintenance/port
	name = "\improper Lower Deck Port Maintenace"

/area/ishimura/lower/maintenance/starboard
	name = "\improper Lower Deck Starboard Maintenance"

//------------------Mining------------------//
/area/ishimura/lower/mining
	name = "\improper Mining"
	icon_state = "miningbase"

/area/ishimura/lower/mining/briefing
	name = "\improper Meeting Room"

/area/ishimura/lower/mining/locker_room
	name = "\improper Mining Locker Room"
	icon_state = "m_lockroom"

/area/ishimura/lower/mining/mining_bay
	name = "\improper Mining Bay"
	icon_state = "miningbay"

/area/ishimura/lower/mining/office
	name = "\improper Director of Mining's Office"

/area/ishimura/lower/mining/office/foreman
	name = "\improper Foreman's Office"
	icon_state = "foremanoffice"

/area/ishimura/lower/mining/processing_room
	name = "\improper Processing Room"
	icon_state = "processing"

/area/ishimura/lower/mining/reception
	name = "\improper Mining Reception"

/area/ishimura/lower/mining/shuttle
	name = "\improper Mining Shuttle"
	requires_power = 0

/area/ishimura/lower/mining/shuttle/one
	name = "\improper Mining Shuttle One"
	icon_state = "m_shuttle_one"

/area/ishimura/lower/mining/shuttle/two
	name = "\improper Mining Shuttle Two"
	icon_state = "m_shuttle_two"

/area/ishimura/lower/mining/shuttlebay
	name = "\improper Mining Shuttle Bay"

/area/ishimura/lower/mining/shuttlebay/port
	name = "\improper Mining Shuttle Bay One"
	icon_state = "m_shuttlebay_one"

/area/ishimura/lower/mining/shuttlebay/starboard
	name = "\improper Mining Shuttle Bay Two"
	icon_state = "m_shuttlebay_two"

/area/ishimura/lower/mining/storage
	name = "\improper Mining Storage"

//------------------Misc------------------//
/area/ishimura/lower/misc
	name = "\improper Misc"
	icon_state = "miscbase"

/area/ishimura/lower/misc/abandon_hydroponics
	name = "\improper Decommissioned Hydroponics"

/area/ishimura/lower/misc/abandon_hydroponics/lobby
	name = "\improper Decommissioned Hydroponics Lobby"

/area/ishimura/lower/misc/abandon_surgery
	name = "\improper Abandoned Surgical Suite"

/area/ishimura/lower/misc/bathroom
	name = "\improper Bathroom"

/area/ishimura/lower/misc/bathroom/aft
	name = "\improper Lower Deck Unisex Bathroom"

/area/ishimura/lower/misc/bathroom/fore
	name = "\improper Bathroom"

/area/ishimura/lower/misc/bathroom/fore/male
	name = "\improper Crew Quarters - Men's Bathroom"

/area/ishimura/lower/misc/bathroom/fore/female
	name = "\improper Crew Quarters - Women's Bathroom"

/area/ishimura/lower/misc/hallway
	name = "\improper Hallway"

/area/ishimura/lower/misc/hallway/aft
	name = "\improper Lower Deck Aft Hallway"

/area/ishimura/lower/misc/hallway/central
	name = "\improper Lower Deck Central Hallway"

/area/ishimura/lower/misc/hallway/escape_executive
	name = "\improper Lower Deck Executive Hallway"

/area/ishimura/lower/misc/janitorcloset
	name = "\improper Janitorial Closet"

/area/ishimura/lower/misc/janitorcloset/aft
	name = "\improper Aft Janitorial Closet"

/area/ishimura/lower/misc/janitorcloset/aft/port
	name = "\improper Aft-Port Janitorial Closet"

/area/ishimura/lower/misc/janitorcloset/aft/starboard
	name = "\improper Aft-Starboard Janitorial Closet"

/area/ishimura/lower/misc/janitorcloset/fore
	name = "\improper Fore Janitoral Closet"

/area/ishimura/lower/misc/janitorcloset/midship
	name = "\improper Midship Janitorial Closet"

/area/ishimura/lower/misc/marker
	name = "\improper Large Storage Room"

/area/ishimura/lower/misc/observationroom
	name = "\improper Observation Room"

//------------------Security - Lower------------------//
/area/ishimura/lower/security
	name = "\improper Security"
	icon_state = "securitybase"

/area/ishimura/lower/security/armory
	name = "\improper Security Armory"

/area/ishimura/lower/security/emergency_supply_room
	name = "\improper Emergency Supply Room"

/area/ishimura/lower/security/escape
	name = "\improper Executive Hangar"

/area/ishimura/lower/security/escape/lounge
	name = "\improper Executive Escape Lounge"

/area/ishimura/lower/security/escape/one
	name = "\improper Hangar Control One"

/area/ishimura/lower/security/escape/two
	name = "\improper Hangar Control Two"

/area/ishimura/lower/security/checkpoint
	name = "\improper Checkpoint"
	icon_state = "checkpoint"

/area/ishimura/lower/security/checkpoint/crew
	name = "\improper Crew Quarters Checkpoint"

/area/ishimura/lower/security/checkpoint/executive
	name = "\improper Executive Quarters Checkpoint"