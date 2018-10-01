
--[[
  TODO:
	* Zombies, once created, should not despawn on their own.
    * Enable increase in speed as light level falls.
    * Enable check for monster density in region before spawning.  It's too high right now.
    * (done) Disable dying in the sunlight.
--]]

local path = minetest.get_modpath("mobs_zombies")

-- TODO: Not sure if I want to force this config value or not.
--minetest.settings:set_bool("mobs_griefing", true)

-- TODO: Enclose player in walls.  See if zombies will try to break through.
-- TODO: Block breaking isn't very realistic.

-- Intllib
dofile(path .. "/intllib.lua")
S = mobs.intllib

-- day_toggle = true for day spawning, false for night or nil for anytime
local day_toggle = nil

minetest.register_craftitem(":mobs_zombies:rotten_flesh", {
	description = S("Rotten Flesh"),
	inventory_image = "rotten_flesh.png",
	on_use = minetest.item_eat(1),
})

--A few tables to simplify.
local skins = {
	--{ "zombie01.png" },
	--{ "zombie02.png" },
	--{ "zombie03.png" },
	--{ "zombie04.png" },
	{ "zombie05.png" }
}

local spawn_nodes = {
	"cityscape:road_broken", "cityscape:sidewalk_broken", "default:gravel",
	"default:stone", "default:dirt_with_grass", "default:dirt",
	"default:cobblestone", "default:mossycobble", "group:sand"
}

-- TODO: Have some XP drop.
local inventory = {
	{ name = "mobs_zombies:rotten_flesh", chance = 2, min = 3, max = 5 },
	{ name = "default:apple", chance = 4, min = 2, max = 5 },
	{ name = "default:steel_ingot", chance = 10, min = 1, max = 4 },
}

local zombie_sounds = {
	distance = 10,			-- maximum distance sounds can be heard, default is 10.
	random = "zombie",		-- random sound that plays during gameplay.
	--war_cry = "zombie",		-- what you hear when mob starts to attack player.
	--attack = "zombie_hit",	-- what you hear when being attacked.
	damage = "zombie_hit",	-- sound heard when mob is hurt.
	death = "zombie_death"	-- played when mob is killed.
}

local base_hp = 10
local base_velocity = 0.5
local base_chance = 70
local base_active_object_count = 2

-------------------------------------

local zombie_def_default = {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	pathfinding = true, -- change to 2 to break blocks?
	knock_back = true,
	reach = 2,
	damage = 1,
	hp_min = base_hp,
	hp_max = base_hp * 2,
	armor = 80,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "zombie_normal.b3d",
	textures = skins,
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = zombie_sounds,
	walk_velocity = base_velocity,
	run_velocity = base_velocity * 2,
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
}

mobs:register_mob("mobs_zombies:normal", zombie_def_default)

--Spawn Function
-- params: name, nodes, max_light, min_light, chance, active_object_count, max_height, day_toggle
mobs:register_spawn("mobs_zombies:normal", spawn_nodes, 15, 0, base_chance, base_active_object_count, 170, day_toggle)

--Spawn Eggs
mobs:register_egg("mobs_zombies:normal", S("Normal Zombie"), "zombie_egg.png", 1)

-------------------------------------

local zombie_def_1arm = table.copy(zombie_def_default)
zombie_def_1arm.damage = 2
zombie_def_1arm.hp_min = base_hp * 2
zombie_def_1arm.hp_max = base_hp * 4
zombie_def_1arm.walk_velocity = base_velocity * 1.5
zombie_def_1arm.run_velocity = base_velocity * 3
zombie_def_1arm.mesh = "zombie_one-arm.b3d"
zombie_def_1arm.animation = {
	speed_normal = 10,
	speed_run = 10,
	punch_speed = 20,
	walk_start = 0,
	walk_end = 20,
	run_start = 0,
	run_end = 20,
	punch_start = 21,
	punch_end = 51,
}
-- TODO: Should losing an arm make the zombie weaker, and perhaps faster?

mobs:register_mob("mobs_zombies:1arm", zombie_def_1arm)

--Spawn Function
mobs:register_spawn("mobs_zombies:1arm", spawn_nodes, 15, 0, base_chance, base_active_object_count, 170, day_toggle)

--Spawn Eggs
mobs:register_egg("mobs_zombies:1arm", S("One Armed Zombie"), "zombie_egg.png", 1)

-------------------------------------

local zombie_def_crawler = table.copy(zombie_def_default)
-- TODO: Maybe crawling zombies should be slower and weaker?
zombie_def_crawler.hp_min = base_hp * 3
zombie_def_crawler.hp_max = base_hp * 6
zombie_def_crawler.collisionbox = {-0.5, -0.5, -0.4, 0.5, 0.2, 0.4}
zombie_def_crawler.mesh = "zombie_crawler.b3d"
zombie_def_crawler.walk_velocity = base_velocity * 0.25
zombie_def_crawler.run_velocity = base_velocity * 0.5 -- Can't really explain how it can run.
zombie_def_crawler.jump = false -- If it can't walk, it can't jump.
zombie_def_crawler.reach = 1
zombie_def_crawler.animation = {
	speed_normal = 10,
	speed_run = 10,
	punch_speed = 60,
	walk_start = 0,
	walk_end = 40,
	run_start = 0,
	run_end = 40,
	punch_start = 41,
	punch_end = 71,
}
mobs:register_mob("mobs_zombies:crawler", zombie_def_crawler)

--Spawn Function
mobs:register_spawn("mobs_zombies:crawler", spawn_nodes,15, 0, base_chance, base_active_object_count, 170, day_toggle)

--Spawn Eggs
mobs:register_egg("mobs_zombies:crawler", S("Crawling Zombie"), "zombie_egg.png", 1)

-------------------------------------

minetest.log("action", S("[MOD] Mobs Zombies loaded"))
