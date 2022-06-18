----------------------------------------------------
-- CRATE MENU DEFAULTS
----------------------------------------------------

local crate_buttons = {"Help", "Target", "Sort", "Close"}
local crate_category = "Decoration"
local crate_tools = {"hammer1"}
local crate_x1 = 7
local crate_x2 = 30
local crate_x3 = 53
local crate_x4 = 76
local crate_x5 = 99
local crate_x6 = 122
local crate_y1 = 17
local crate_y2 = 40
local crate_y3 = 63
local crate_y4 = 86

----------------------------------------------------
-- NPC MENU DEFAULTS
----------------------------------------------------
dialogue_sprite = "sprites/menu/npc_dialogue_menu.png"
shop_sprite = "sprites/menu/npc_shop_menu.png"


----------------------------------------------------
-- SMALL CRATE MENU
----------------------------------------------------

small_crate_buttons = crate_buttons
small_crate_category = crate_category
small_crate_help_info = {
    {"1. Storage", "BLUE"}
}
small_crate_layout = {
    {crate_x1, crate_y1},
    {crate_x1, crate_y2},
    {crate_x1, crate_y3},
    {crate_x2, crate_y1},
    {crate_x2, crate_y2},
    {crate_x2, crate_y3},
    {crate_x3, crate_y1},
    {crate_x3, crate_y2},
    {crate_x3, crate_y3},
    {crate_x4, crate_y1},
    {crate_x4, crate_y2},
    {crate_x4, crate_y3}
}
small_crate_scripts = {}
small_crate_sprite_menu = "sprites/menu/small_crate_menu_object.png"
small_crate_tools = crate_tools

----------------------------------------------------
-- LARGE CRATE MENU
----------------------------------------------------

large_crate_buttons = crate_buttons
large_crate_category = crate_category
large_crate_help_info = {
    {"1. Storage", "BLUE"}
}
large_crate_layout = {
    {crate_x1, crate_y1},
    {crate_x1, crate_y2},
    {crate_x1, crate_y3},
    {crate_x1, crate_y4},
    {crate_x2, crate_y1},
    {crate_x2, crate_y2},
    {crate_x2, crate_y3},
    {crate_x2, crate_y4},
    {crate_x3, crate_y1},
    {crate_x3, crate_y2},
    {crate_x3, crate_y3},
    {crate_x3, crate_y4},
    {crate_x4, crate_y1},
    {crate_x4, crate_y2},
    {crate_x4, crate_y3},
    {crate_x4, crate_y4},
    {crate_x5, crate_y1},
    {crate_x5, crate_y2},
    {crate_x5, crate_y3},
    {crate_x5, crate_y4},
    {crate_x6, crate_y1},
    {crate_x6, crate_y2},
    {crate_x6, crate_y3},
    {crate_x6, crate_y4}
}
large_crate_scripts = {}
large_crate_sprite_menu = "sprites/menu/large_crate_menu_object.png"
large_crate_tools = crate_tools