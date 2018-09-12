local path = minetest.get_modpath("mobs_zombies")

-- Intllib
dofile(path .. "/intllib.lua")
S = mobs.intllib

core.register_craftitem(":mobs_zombies:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "rotten_flesh.png",
	on_use = core.item_eat(1),
})

--A few tables to simplify.
skins = {
	{ "zombie01.png" },
	{ "zombie02.png" },
	{ "zombie03.png" },
	{ "zombie04.png" },
	{ "zombie05.png" }
}

local spawn_nodes = {
	"cityscape:road_broken", "cityscape:sidewalk_broken", "default:gravel",
	"default:stone", "default:dirt_with_grass", "default:dirt",
	"default:cobblestone", "default:mossycobble", "group:sand"
}

inventory = {
	{ name = "mobs_zombies:rotten_flesh", chance = 2, min = 3, max = 5 },
	{ name = "default:apple", chance = 4, min = 2, max = 5 },
	{ name = "default:steel_ingot", chance = 10, min = 1, max = 4 },
}

local zombie_sounds = {
	random = "eating-brains",
	attack = "groan",
}

mobs:register_mob('mobs_zombies:1arm', {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 15,
	armor = 80,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "zombie_one-arm.b3d",
	textures = skins,
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
	sounds = zombie_sounds,
	walk_velocity = 2,
	run_velocity = 4,
	jump = true,
	view_range = 15,
	drops = inventory,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 2,
	animation = {
		speed_normal = 10,
		speed_run = 10,
		punch_speed = 20,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
		punch_start = 21,
		punch_end = 51,
	},
})

--Spawn Function
mobs:register_spawn("mobs_zombies:1arm", spawn_nodes, 15, 0, 70, 10, 170, false)

--Spawn Eggs
mobs:register_egg("mobs_zombies:1arm", S("One Armed Zombie"), "zombie_egg.png", 1)

-------------------------------------

mobs:register_mob('mobs_zombies:crawler', {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 1,
	hp_min = 1,
	hp_max = 10,
	armor = 80,
	collisionbox = {-0.5, -.5, -0.4, 0.5, 0.2, 0.4},
	visual = "mesh",
	mesh = "zombie_crawler.b3d",
	textures = skins,
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
	sounds = zombie_sounds,
	walk_velocity = .5,
	run_velocity = 1,
	jump = true,
	view_range = 15,
	drops = inventory,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 2,
	animation = {
		speed_normal = 10,
		speed_run = 10,
		punch_speed = 60,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 41,
		punch_end = 71,
	},
})

--Spawn Function
mobs:register_spawn("mobs_zombies:crawler", spawn_nodes,15, 0, 70, 10, 170, false)

--Spawn Eggs
mobs:register_egg("mobs_zombies:crawler", S("Crawling Zombie"), "zombie_egg.png", 1)

-------------------------------------

mobs:register_mob('mobs_zombies:normal', {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 1,
	hp_min = 1,
	hp_max = 10,
	armor = 80,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "zombie_normal.b3d",
	textures = skins,
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
	sounds = zombie_sounds,
	walk_velocity = 2,
	run_velocity = 4,
	jump = true,
	view_range = 15,
	drops = inventory,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 2,
	animation = {
		speed_normal = 20,
		speed_run = 20,
		punch_speed = 20,
		stand_start = 0,
		stand_end = 40,
		walk_start = 41,
		walk_end = 101,
		run_start = 41,
		run_end = 101,
		punch_start = 102,
		punch_end = 142,
	},
})

--Spawn Function
mobs:register_spawn("mobs_zombies:normal", spawn_nodes, 15, 0, 70, 10, 170, false)

--Spawn Eggs
mobs:register_egg("mobs_zombies:normal", S("Normal Zombie"), "zombie_egg.png", 1)

-------------------------------------

minetest.log("action", S("[MOD] Mobs Zombies loaded"))
