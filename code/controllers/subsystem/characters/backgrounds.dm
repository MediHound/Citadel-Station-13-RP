/datum/controller/subsystem/characters
	//! Backgrounds - to be shoved into some lore system later (maybe)
	var/list/character_origins
	var/list/character_citizenships
	var/list/character_religions
	var/list/character_factions

/datum/controller/subsystem/characters/proc/rebuild_backgrounds()
	character_origins = list()
	character_citizenships = list()
	character_religions = list()
	character_factions = list()

	for(var/path in subtypesof(/datum/lore/character_background))
		var/datum/lore/character_background/L = path
		if(initial(L.abstract_type) == path)
			continue
		L = new path
		if(istype(L, /datum/lore/character_background/citizenship))
			if(character_citizenships[L.id])
				stack_trace("dupe [L.id] on [L.type]")
				continue
			character_citizenships[L.id] = L
		if(istype(L, /datum/lore/character_background/origin))
			if(character_origins[L.id])
				stack_trace("dupe [L.id] on [L.type]")
				continue
			character_origins[L.id] = L
		if(istype(L, /datum/lore/character_background/religion))
			if(character_religions[L.id])
				stack_trace("dupe [L.id] on [L.type]")
				continue
			character_religions[L.id] = L
		if(istype(L, /datum/lore/character_background/faction))
			if(character_factions[L.id])
				stack_trace("dupe [L.id] on [L.type]")
				continue
			character_factions[L.id] = L

/datum/controller/subsystem/characters/proc/available_citizenships(species_id)

/datum/controller/subsystem/characters/proc/available_religions(species_id)

/datum/controller/subsystem/characters/proc/available_factions(species_id)

/datum/controller/subsystem/characters/proc/available_origins(species_id)

/datum/controller/subsystem/characters/proc/resolve_citizenship(id)
	RETURN_TYPE(/datum/lore/character_background/citizenship)
	if(ispath(id))
		var/datum/lore/character_background/bg = id
		id = initial(bg.id)
	return character_citizenships[id]

/datum/controller/subsystem/characters/proc/resolve_faction(id)
	RETURN_TYPE(/datum/lore/character_background/faction)
	if(ispath(id))
		var/datum/lore/character_background/bg = id
		id = initial(bg.id)
	return character_factions[id]

/datum/controller/subsystem/characters/proc/resolve_religion(id)
	RETURN_TYPE(/datum/lore/character_background/religion)
	if(ispath(id))
		var/datum/lore/character_background/bg = id
		id = initial(bg.id)
	return character_religions[id]

/datum/controller/subsystem/characters/proc/resolve_origin(id)
	RETURN_TYPE(/datum/lore/character_background/origin)
	if(ispath(id))
		var/datum/lore/character_background/bg = id
		id = initial(bg.id)
	return character_origins[id]

/datum/controller/subsystme/characters/proc/job_locks_for_faction(id)
	var/datum/lore/character_background/faction/F = resolve_faction(id)
	return F.job_whitelist

#warn impl
