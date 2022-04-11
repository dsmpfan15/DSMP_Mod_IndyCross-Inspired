local style = "inner" -- inner, center, edge, outer

local width = 603 -- default: 593
local height = 15 -- default: 11

local bar_offset_x = 10 -- default: 0
local bar_offset_y = -14 -- default: 0
local barb_offset_y = 0 -- default: 0
local barB_offset_x = 0 -- default: 0

local border_color = "000000"
local border_thickness = 4 -- default: 4

local override_colors = true -- default: false
local override_p1_color = override_colors and "1496A6" or nil
local override_p2_color = override_colors and "8B1C44" or nil

local p1_offset_x = -26 -- default: -26
local p1_offset_y = 0 -- default: 0
local p2_offset_x = 26 -- default: 26
local p2_offset_y = 0 -- default: 0

--

local function to_hex(rgb)
	return string.format("%x", (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3])
end

local sprite_border = "healthbar_border"
local sprite_p1 = "healthbar_p1"
local sprite_p2 = "healthbar_p2"

local bar_origin_x 
local bar_origin_y

local p_origin_y

function onCreatePost()
	setProperty("healthBarBG.visible", false)
	setProperty("healthBar.visible", false)
	
	bar_origin_x = (1280 - width) / 2
	bar_origin_y = getProperty("healthBarBG.sprTracker.y") - (height / 2)
	p_origin_y = getProperty("iconP1.y")
	
	makeLuaSprite(sprite_border, "cuphealthbar",
		bar_origin_x - border_thickness + barB_offset_x,
		bar_origin_y - border_thickness + bar_offset_y
	)

	addLuaSprite(sprite_border, true)
	setObjectCamera(sprite_border, "hud")
	setObjectOrder(sprite_border, 3)
	
	makeLuaSprite(sprite_p1, "",
		bar_origin_x + (width / 2) + bar_offset_x,
		bar_origin_y + barb_offset_y
	)
	makeGraphic(sprite_p1,
		(width / 2),
		height,
		override_colors and override_p1_color or to_hex(getProperty("boyfriend.healthColorArray"))
	)
	addLuaSprite(sprite_p1, true)
	setObjectCamera(sprite_p1, "hud")
	setObjectOrder(sprite_p1, 2)
	setProperty(sprite_p1 .. ".origin.x", getProperty(sprite_p1 .. ".width"))
	
	makeLuaSprite(sprite_p2, "",
		bar_origin_x + bar_offset_x,
		bar_origin_y + barb_offset_y
	)
	makeGraphic(sprite_p2,
		(width / 2),
		height,
		override_colors and override_p2_color or to_hex(getProperty("dad.healthColorArray"))
	) 
	addLuaSprite(sprite_p2, true)
	setObjectCamera(sprite_p2, "hud")
	setObjectOrder(sprite_p2, 1)
	setProperty(sprite_p2 .. ".origin.x", 0)
end

function onUpdatePost()
	local percent_p1 = (getProperty("healthBar.percent") / 100)
	local percent_p2 = 1 - percent_p1
	
	local scale_p1 = (percent_p1 * 2) + (percent_p1 < 1 and 0.01 or 0)
	local scale_p2 = percent_p2 * 2
	setProperty(sprite_p1 .. ".scale.x", scale_p1)
	setProperty(sprite_p2 .. ".scale.x", scale_p2)
	
	local real_width_p1 = getProperty(sprite_p1 .. ".width") * scale_p1
	local real_width_p2 = getProperty(sprite_p2 .. ".width") * scale_p2
	
	local center_p1 = -getProperty("iconP1.frameWidth") / 2
	local center_p2 = -getProperty("iconP2.frameWidth") / 2
	
	local temp_x_p1 = {
		["inner"] = bar_origin_x + real_width_p2 + p1_offset_x,
		["center"] = bar_origin_x + real_width_p2 + (real_width_p1 / 2) + center_p1,
		["edge"] = bar_origin_x + width + center_p1,
		["outer"] = bar_origin_x + width + center_p1 + 150 + p1_offset_x
	}
	
	local temp_x_p2 = {
		["inner"] = bar_origin_x + real_width_p2 - 150 + p2_offset_x,
		["center"] = bar_origin_x + (real_width_p2 / 2) + center_p2,
		["edge"] = bar_origin_x + center_p2,
		["outer"] = bar_origin_x + center_p2 - 150 + p2_offset_x
	}
	
	setProperty(sprite_border .. ".x", bar_origin_x - border_thickness + barB_offset_x)
	setProperty(sprite_border .. ".y", bar_origin_y - border_thickness + bar_offset_y)
	
	setProperty(sprite_p1 .. ".x", bar_origin_x + (width / 2) + bar_offset_x)
	setProperty(sprite_p1 .. ".y", bar_origin_y + barb_offset_y)
	
	setProperty(sprite_p2 .. ".x", bar_origin_x + bar_offset_x)
	setProperty(sprite_p2 .. ".y", bar_origin_y + barb_offset_y)
	
	setProperty("iconP1.x", (temp_x_p1[style] or temp_x_p1["inner"]) + bar_offset_x)
	setProperty("iconP2.x", (temp_x_p2[style] or temp_x_p2["inner"]) + bar_offset_x)
	setProperty("iconP1.y", p_origin_y + bar_offset_y + p1_offset_y)
	setProperty("iconP2.y", p_origin_y + bar_offset_y + p2_offset_y)
end
