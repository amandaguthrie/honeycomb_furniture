local module_object_name = "objects"

furniture_items = {}
test_furniture_items = {"log","honeycomb","beeswax","propolis","axe1","hammer1","beehive1","beehive2","beehive3","beehive4","beehive5","beehive6","beehive7","beehive8","beehive9","beehive10"}

----------------------------------------------------
-- CREATE FURNITURE AND RECIPES
----------------------------------------------------


function define_furniture()

    local function_name = module_object_name .. ".define_furniture"
    local log_message = "defining workbench details or furniture."
    local function_status = "Success"
    
    local workbench_status = define_workbench()
    if workbench_status ~= "Success" then function_status = nil end

    local define_honeycomb_bookshelf_status = define_object_honeycomb_bookshelf()
    if define_honeycomb_bookshelf_status ~= "Success" then function_status = nil end

    local define_honeycomb_table_status = define_object_honeycomb_table()
    if define_honeycomb_table_status ~= "Success" then function_status = nil end

    local define_honeycomb_trophyshelf_status = define_object_honeycomb_trophyshelf()
    if define_honeycomb_trophyshelf_status ~= "Success" then function_status = nil end

    local define_large_crate_status = define_menu_object_large_crate()
    if define_large_crate_status ~= "Success" then function_status = nil end

    local define_small_crate_status = define_menu_object_small_crate()
    if define_small_crate_status ~= "Success" then function_status = nil end

    local define_happy_bee_plush_status = define_object_bee_plush()
    if define_happy_bee_plush_status ~= "Success" then function_status = nil end

    mod_log_status(function_status, function_name, log_message)

    return function_status

end


----------------------------------------------------
-- CUSTOMIZE WORKBENCH
----------------------------------------------------

local decoration_tab = {id = "t1", label = "Decoration"}
local dining_tab = {id = "t2", label = "Dining"}
local storage_tab = {id = "t3", label = "Storage"}
local four_tab = {id = "t4", label = "4"}
local other_tab = {id = "t5", label = "Other"}


function define_workbench()
    local function_name = module_object_name .. ".define_workbench"
    local log_message = "defining mod workbench."

    local define_workbench_status = api_define_workbench(
        MOD_NAME_FRIENDLY,
        {
            t1 = decoration_tab["label"],
            t2 = dining_tab["label"],
            t3 = storage_tab["label"],
            t4 = four_tab["label"],
            t5 = other_tab["label"]
        }
    )

    return mod_log_status(define_workbench_status, function_name, "defining workbench name and labels.")

end


----------------------------------------------------
-- OBJECT DEFINITIONS
----------------------------------------------------

-- * DECORATION * --

function define_object_honeycomb_bookshelf()

    local function_name = module_object_name .. ".define_object_honeycore_bookshelf"
    local function_status = "Success"
    local log_message = "defining honeycomb bookshelf and recipe."
    local object_id = "honeycomb_bookshelf"

    local define_object_honeycomb_bookshelf_status = api_define_object(
        {
            id = object_id,
            name = "Honeycomb Bookshelf",
            category = "Decoration",
            tooltip = "A bookshelf made of honeycomb.",
            tools = {"hammer1"},
            shop_sell = 30,
            shop_buy = 15
        },
        "sprites/furniture/honeycomb_bookshelf_object.png"
    )

    mod_log_status(define_object_honeycomb_bookshelf_status, function_name, "defining honeycomb bookshelf object.")
    if define_object_honeycomb_bookshelf_status ~= "Success" then function_status = nil end

    local recipe = {
        { item = "honeycomb", amount = 20 },
        { item = "beeswax", amount = 10 }
    }

    local define_object_recipe = api_define_recipe(
        decoration_tab["id"], -- tab
        MOD_NAME .. "_" .. object_id, --item
        recipe, -- recipe
        1 -- amount
    )

    table.insert(furniture_items, construct_id(object_id))

    mod_log_status(define_object_recipe, function_name, "defining honeycomb bookshelf recipe.")
    if define_object_recipe ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end


function define_object_honeycomb_trophyshelf()

    local function_name = module_object_name .. ".define_object_honeycore_trophyshelf"
    local function_status = "Success"
    local log_message = "defining honeycomb trophy shelf object and recipe."
    local object_id = "honeycomb_trophyshelf"

    local define_object_honeycomb_trophyshelf_status = api_define_object(
        {
            id = object_id,
            name = "Honeycomb Trophy Shelf",
            category = "Decoration",
            tooltip = "A trophy shelf made of honeycomb.",
            tools = {"hammer1"},
            shop_sell = 15,
            shop_buy = 30
        },
        "sprites/furniture/honeycomb_trophyshelf_object.png"
    )

    mod_log_status(define_object_honeycomb_trophyshelf_status, function_name, "defining honeycomb trophy shelf object.")
    if define_object_honeycomb_trophyshelf_status ~= "Success" then function_status = nil end

    local recipe = {
        { item = "honeycomb", amount = 20 },
        { item = "beeswax", amount = 10 }
    }

    local define_object_recipe = api_define_recipe(
        decoration_tab["id"], -- tab
        MOD_NAME .. "_" .. object_id, --item
        recipe, -- recipe
        1 -- amount
    )

    table.insert(furniture_items, construct_id(object_id))

    mod_log_status(define_object_recipe, function_name, "defining honeycomb trophy shelf recipe.")
    if define_object_recipe ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end

-- * DINING * --

function define_object_honeycomb_table()

    local function_name = module_object_name .. ".define_object_honeycore_table"
    local function_status = "Success"
    local log_message = "defining honeycomb table and recipe."
    local object_id = "honeycomb_table"

    local define_object_honeycomb_table_status = api_define_object(
        {
            id = object_id,
            name = "Honeycomb Table",
            category = "Decoration",
            tooltip = "A table made of honeycomb.",
            tools = {"hammer1"},
            shop_sell = 15,
            shop_buy = 30
        },
        "sprites/furniture/honeycomb_table_object.png"
    )

    mod_log_status(define_object_honeycomb_table_status, function_name, "defining honeycomb table object.")
    if define_object_honeycomb_table_status ~= "Success" then function_status = nil end

    local recipe = {
        { item = "honeycomb", amount = 15 },
        { item = "beeswax", amount = 10 }
    }

    local define_object_recipe = api_define_recipe(
        dining_tab["id"], -- tab
        MOD_NAME .. "_" .. object_id, --item
        recipe, -- recipe
        1 -- amount
    )

    table.insert(furniture_items, construct_id(object_id))

    mod_log_status(define_object_recipe, function_name, "defining honeycomb table recipe.")
    if define_object_recipe ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end

-- * OTHER * --

function define_object_bee_plush()

    local function_name = module_object_name .. ".define_object_bee_plush"
    local function_status = "Success"
    local log_message = "defining bee plush."
    local object_id = "bee_plush_happy"

    local define_object_bee_plush_status = api_define_object(
        {
            id = object_id,
            name = "Happy Bee Plush",
            category = "Decoration",
            tooltip = "A bee plush with a big smile.",
            tools = {"mouse1", "hammer1"},
            shop_sell = 5,
            shop_buy = 10
        },
        "sprites/furniture/bee_plush_happy_object.png"
    )

    mod_log_status(define_object_bee_plush_status, function_name, "defining happy bee plush object.")
    if define_object_bee_plush_status ~= "Success" then function_status = nil end

    local recipe = {
        { item = "honeycomb", amount = 5 },
        { item = "propolis", amount = 10 },
        { item = "beeswax", amount = 3 }
    }

    local define_object_recipe = api_define_recipe(
        other_tab["id"], -- tab
        MOD_NAME .. "_" .. object_id, --item
        recipe, -- recipe
        1 -- amount
    )

 --   table.insert(furniture_items, construct_id(object_id)) -- this is Darbee's only special, so don't include it in the furniture rotation.

    mod_log_status(define_object_recipe, function_name, "defining happy bee plush recipe.")
    if define_object_recipe ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end


----------------------------------------------------
-- MENU OBJECT DEFINITIONS
----------------------------------------------------

-- * STORAGE * --

function define_menu_object_large_crate()

    local function_name = module_object_name .. ".define_menu_object_large_crate"
    local function_status = "Success"
    local log_message = "defining large honeycomb crate object and recipe."
    local object_id = "honeycomb_crate_large"
    
    local define_menu_object_large_crate_status = api_define_menu_object(
        {
            id = object_id,
            name = "Large Honeycomb Crate",
            category = large_crate_category,
            tooltip = "A large crate made of honeycomb. Holds 24 stacks.",
            tools = large_crate_tools,
            info = large_crate_help_info,
            buttons = large_crate_buttons,
            layout = large_crate_layout,
            shop_sell = 15,
            shop_buy = 30
        },
        "sprites/furniture/honeycomb_large_crate_object.png",
        large_crate_sprite_menu,
        large_crate_scripts
    )

    mod_log_status(define_menu_object_large_crate_status, function_name, "defining large honeycomb crate object.")
    if define_menu_object_large_crate_status ~= "Success" then function_status = nil end

    local recipe = {
        { item = "honeycomb", amount = 20 },
        { item = "beeswax", amount = 10 }
    }

    local define_object_recipe = api_define_recipe(
        storage_tab["id"], -- tab
        MOD_NAME .. "_" .. object_id, --item
        recipe, -- recipe
        1 -- amount
    )

    table.insert(furniture_items, construct_id(object_id))

    mod_log_status(define_object_recipe, function_name, "defining large honeycomb crate recipe.")
    if define_object_recipe ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end

function define_menu_object_small_crate()

    local function_name = module_object_name .. ".define_menu_object_small_crate"
    local function_status = "Success"
    local log_message = "defining small honeycomb crate object and recipe."
    local object_id = "honeycomb_crate_small"

    local define_menu_object_small_crate_status = api_define_menu_object(
        {
            id = object_id,
            name = "Small Honeycomb Crate",
            category = small_crate_category,
            tooltip = "A small crate made of honeycomb. Holds 12 stacks.",
            tools = small_crate_tools,
            info = small_crate_help_info,
            buttons = small_crate_buttons,
            layout = small_crate_layout,
            shop_sell = 10,
            shop_buy = 20
        },
        "sprites/furniture/honeycomb_small_crate_object.png",
        small_crate_sprite_menu,
        small_crate_scripts
    )

    mod_log_status(define_menu_object_small_crate_status, function_name, "defining small honeycomb crate object.")
    if define_menu_object_small_crate_status ~= "Success" then function_status = nil end

    local recipe = {
        { item = "honeycomb", amount = 15 },
        { item = "beeswax", amount = 5 }
    }

    local define_object_recipe = api_define_recipe(
        storage_tab["id"], -- tab
        MOD_NAME .. "_" .. object_id, --item
        recipe, -- recipe
        1 -- amount
    )

    table.insert(furniture_items, construct_id(object_id))

    mod_log_status(define_object_recipe, function_name, "defining small honeycomb crate recipe.")
    if define_object_recipe ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end