local module_object_name = "objects"

furniture_items = {}
test_furniture_items = {"log","honeycomb","beeswax","propolis","axe1","hammer1","beehive1","beehive2","beehive3","beehive4","beehive5","beehive6","beehive7","beehive8","beehive9","beehive10"}

----------------------------------------------------
-- WORKBENCH VARIABLES
----------------------------------------------------
decoration_tab = {id = "t1", label = "Decoration"}
dining_tab = {id = "t2", label = "Dining"}
storage_tab = {id = "t3", label = "Storage"}
four_tab = {id = "t4", label = "4"}
other_tab = {id = "t5", label = "Other"}


----------------------------------------------------
-- DEFINE FURNITURE AND RECIPES
----------------------------------------------------

function define_furniture()

    local function_name = module_object_name .. ".define_furniture"
    local log_message = "defining workbench details or furniture."
    local function_status = "Success"
    
    local workbench_status = define_workbench()
    if workbench_status ~= "Success" then function_status = nil end

    local furniture_status = define_objects(objects_to_define)
    if furniture_status ~= "Success" then function_status = nil end

    local menu_status = define_menu_objects(menu_objects_to_define)
    if furniture_status ~= "Success" then function_status = nil end

    mod_log_status(function_status, function_name, log_message)

    return function_status

end


----------------------------------------------------
-- CUSTOMIZE WORKBENCH
----------------------------------------------------


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

local object_defaults = {
    id = "honeycomb_object", -- example only
    name = "Honeycomb Object ", -- example only
--        category = category_decoration, -- example only
    tooltip = "An object made of honeycomb.", -- example only
    shop_key = false,
    shop_sell = 30,
    shop_buy = 15,
    machines = {},
    tools = {"hammer1"},
    place_grass = true,
    place_water = false,
    place_deep = false,
    durability = false,
    hp = false,
    singular = false,
    honeycore = false,
    invisible = false,
    sprite = "sprites/furniture/honeycomb_object_object.png", -- example only
    item_sprite = "sprites/furniture/honeycomb_object_item.png", -- example only
    recipe = {
        { item = "honeycomb", amount = 20 },
        { item = "beeswax", amount = 10 }       
    }, -- example only
    recipe_tab = decoration_tab["id"], --defined on objects.lua, example only
    recipe_amount = 1
}

objects_to_define = {

-- * DECORATION * --

    {
        id = "honeycomb_bookshelf",
        name = "Honeycomb Bookshelf",
        category = "Decoration",
        tooltip = "A bookshelf made of honeycomb.",
        shop_key = object_defaults["shop_key"],
        shop_sell = 30,
        shop_buy = 15,
        machines = object_defaults["machines"],
        tools = object_defaults["tools"],
        place_grass = object_defaults["place_grass"],
        place_water = object_defaults["place_water"],
        place_deep = object_defaults["place_deep"],
        durability = object_defaults["durability"],
        hp = object_defaults["hp"],
        singular = object_defaults["singular"],
        honeycore = object_defaults["honeycore"],
        invisible = object_defaults["invisible"],
        bed = object_defaults["bed"],
        bench = object_defaults["bench"],
        has_lighting = object_defaults["has_lighting"],
        has_shadow = object_defaults["has_shadow"],
        pickable = object_defaults["pickable"],
        variants = object_defaults["variants"],
        growth = object_defaults["growth"],
        item_sprite = nil,
        sprite = "sprites/furniture/honeycomb_bookshelf_object.png",
        recipe = {
            { item = "honeycomb", amount = 20 },
            { item = "beeswax", amount = 10 }       
        },
        recipe_tab = decoration_tab["id"],
        recipe_amount = object_defaults["amount"]
    },
    {
        id = "honeycomb_trophyshelf",
        name = "Honeycomb Trophy Shelf",
        category = "Decoration",
        tooltip = "A trophy shelf made of honeycomb.",
        shop_key = object_defaults["shop_key"],
        shop_sell = 30,
        shop_buy = 15,
        machines = object_defaults["machines"],
        tools = object_defaults["tools"],
        place_grass = object_defaults["place_grass"],
        place_water = object_defaults["place_water"],
        place_deep = object_defaults["place_deep"],
        durability = object_defaults["durability"],
        hp = object_defaults["hp"],
        singular = object_defaults["singular"],
        honeycore = object_defaults["honeycore"],
        invisible = object_defaults["invisible"],
        bed = object_defaults["bed"],
        bench = object_defaults["bench"],
        has_lighting = object_defaults["has_lighting"],
        has_shadow = object_defaults["has_shadow"],
        pickable = object_defaults["pickable"],
        variants = object_defaults["variants"],
        growth = object_defaults["growth"],
        item_sprite = nil,
        sprite = "sprites/furniture/honeycomb_trophyshelf_object.png",
        recipe = {
            { item = "honeycomb", amount = 20 },
            { item = "beeswax", amount = 10 }    
        },
        recipe_tab = decoration_tab["id"],
        recipe_amount = object_defaults["amount"],
        npc_special = false
    },

-- * DINING * --

    {
        id = "honeycomb_table",
        name = "Honeycomb Table",
        category = "Dining",
        tooltip = "A table made of honeycomb.",
        shop_key = object_defaults["shop_key"],
        shop_sell = 30,
        shop_buy = 15,
        machines = object_defaults["machines"],
        tools = object_defaults["tools"],
        place_grass = object_defaults["place_grass"],
        place_water = object_defaults["place_water"],
        place_deep = object_defaults["place_deep"],
        durability = object_defaults["durability"],
        hp = object_defaults["hp"],
        singular = object_defaults["singular"],
        honeycore = object_defaults["honeycore"],
        invisible = object_defaults["invisible"],
        bed = object_defaults["bed"],
        bench = object_defaults["bench"],
        has_lighting = object_defaults["has_lighting"],
        has_shadow = object_defaults["has_shadow"],
        pickable = object_defaults["pickable"],
        variants = object_defaults["variants"],
        growth = object_defaults["growth"],
        item_sprite = nil,
        sprite = "sprites/furniture/honeycomb_table_object.png",
        recipe = {
            { item = "honeycomb", amount = 15 },
            { item = "beeswax", amount = 10 }
        },
        recipe_tab = dining_tab["id"],
        recipe_amount = object_defaults["amount"],
        npc_special = false
    },

-- * OTHER * --
    {
        id = "bee_plush_happy",
        name = "Happy Bee Plush",
        category = "Other",
        tooltip = "A bee plush with a big smile.",
        shop_key = object_defaults["shop_key"],
        shop_sell = 5,
        shop_buy = 10,
        machines = object_defaults["machines"],
        tools = {"mouse1","hammer1"},
        place_grass = object_defaults["place_grass"],
        place_water = object_defaults["place_water"],
        place_deep = object_defaults["place_deep"],
        durability = object_defaults["durability"],
        hp = object_defaults["hp"],
        singular = object_defaults["singular"],
        honeycore = object_defaults["honeycore"],
        invisible = object_defaults["invisible"],
        bed = object_defaults["bed"],
        bench = object_defaults["bench"],
        has_lighting = object_defaults["has_lighting"],
        has_shadow = object_defaults["has_shadow"],
        pickable = object_defaults["pickable"],
        variants = object_defaults["variants"],
        growth = object_defaults["growth"],
        item_sprite = nil,
        sprite = "sprites/furniture/bee_plush_happy_object.png",
        recipe = {
            { item = "honeycomb", amount = 5 },
            { item = "propolis", amount = 10 },
            { item = "beeswax", amount = 3 }
        },
        recipe_tab = other_tab["id"],
        recipe_amount = object_defaults["amount"],
        npc_special = true
    }
}

function define_objects(table_of_objects)

    local function_name = "define_objects"
    local function_status = "Success"

    if #table_of_objects ~= 0 then
        for object=1, #table_of_objects do
            local api_define_object_status = api_define_object(
                {
                    id = table_of_objects[object]["id"],
                    name = table_of_objects[object]["name"],           
                    category = table_of_objects[object]["category"], 
                    tooltip = table_of_objects[object]["tooltip"], 
                    shop_key = table_of_objects[object]["shop_key"],
                    shop_sell = table_of_objects[object]["shop_sell"],
                    shop_buy = table_of_objects[object]["shop_buy"],
                    machines = table_of_objects[object]["machines"],
                    tools = table_of_objects[object]["tools"],
                    place_grass = table_of_objects[object]["place_grass"],
                    place_water = table_of_objects[object]["place_water"],
                    place_deep = table_of_objects[object]["place_deep"],
                    durability = table_of_objects[object]["durability"],
                    hp = table_of_objects[object]["hp"],
                    singular = table_of_objects[object]["singular"],
                    honeycore = table_of_objects[object]["honeycore"],
                    invisible = table_of_objects[object]["invisible"],
                    item_sprite = table_of_objects[object]["item_sprite"]
                },
                table_of_objects[object]["sprite"]
            )

            mod_log_status(api_define_object_status, function_name, "defining " .. table_of_objects[object]["name"] .. " object.")
            if api_define_object_status ~= "Success" then function_status = nil end

            local define_recipe_object_status = api_define_recipe(
                table_of_objects[object]["recipe_tab"],
                construct_id(table_of_objects[object]["id"]),
                table_of_objects[object]["recipe"],
                table_of_objects[object]["amount"]
            )

            mod_log_status(api_define_object_status, function_name, "defining " .. table_of_objects[object]["name"] .. " recipe.")
            if define_recipe_object_status ~= "Success" then function_status = nil end
            
            if table_of_objects[object]["npc_special"] ~= true then
                table.insert(furniture_items, construct_id(table_of_objects[object]["id"]))               
            end 

        end

    end

    return mod_log_status(function_status, function_name, "defining objects or recipes.")

end

----------------------------------------------------
-- MENU OBJECT DEFINITIONS
----------------------------------------------------
----------------------------------------------------
-- CRATE COORDINATES
----------------------------------------------------

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
-- CRATE MENU DEFAULTS
----------------------------------------------------

menu_object_crate_defaults = {
    id = "",
    name = "",
    category = "Decoration",
    tooltip = "",
    shop_key = false,
    shop_buy = 15,
    shop_sell = 30,
    layout = {},
    info = {},
    buttons = {"Help", "Target", "Sort", "Close"},
    machines = nil,
    tools = {"hammer1"},
    nature = true,
    aquatic = false,
    deep = false,
    singular = false,
    invisible = false,
    center = false,
    item_sprite = nil,
    sprite_image = nil,
    menu_image = nil,
    scripts = {},
    draw_script = nil,
    recipe_tab = storage_tab["id"],
    recipe = {},
    recipe_amount = 1    
}

menu_object_crate_small_defaults = {
    id = "",
    name = "",
    category = menu_object_crate_defaults["category"],
    tooltip = "Holds 12 stacks.",
    shop_key = menu_object_crate_defaults["shop_key"],
    shop_buy = menu_object_crate_defaults["shop_buy"],
    shop_sell = menu_object_crate_defaults["shop_sell"],
    layout = {
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
    },
    info = {
        {"1. Storage", "BLUE"}
    },
    buttons = menu_object_crate_defaults["buttons"],
    machines = menu_object_crate_defaults["machines"],
    tools = menu_object_crate_defaults["tools"],
    nature = menu_object_crate_defaults["nature"],
    aquatic = menu_object_crate_defaults["aquatic"],
    deep = menu_object_crate_defaults["deep"],
    singular = menu_object_crate_defaults["singular"],
    invisible = menu_object_crate_defaults["invisible"],
    center = menu_object_crate_defaults["center"],
    item_sprite = menu_object_crate_defaults["item_sprite"],
    sprite_image = nil,
    menu_image = "sprites/menu/small_crate_menu_object.png",
    scripts = menu_object_crate_defaults["scripts"],
    draw_script = menu_object_crate_defaults["draw_script"],
    recipe_tab = menu_object_crate_defaults["recipe_tab"],
    recipe = menu_object_crate_defaults["recipe"],
    recipe_amount = menu_object_crate_defaults["recipe_amount"]
}

menu_object_crate_large_defaults = {
    id = "",
    name = "",
    category = menu_object_crate_defaults["category"],
    tooltip = "Holds 24 stacks.",
    shop_key = menu_object_crate_defaults["shop_key"],
    shop_buy = menu_object_crate_defaults["shop_buy"],
    shop_sell = menu_object_crate_defaults["shop_sell"],
    layout = {
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
    },
    info = {
        {"1. Storage", "BLUE"}
    },
    buttons = menu_object_crate_defaults["buttons"],
    machines = menu_object_crate_defaults["machines"],
    tools = menu_object_crate_defaults["tools"],
    nature = menu_object_crate_defaults["nature"],
    aquatic = menu_object_crate_defaults["aquatic"],
    deep = menu_object_crate_defaults["deep"],
    singular = menu_object_crate_defaults["singular"],
    invisible = menu_object_crate_defaults["invisible"],
    center = menu_object_crate_defaults["center"],
    item_sprite = menu_object_crate_defaults["item_sprite"],
    sprite_image = nil,
    menu_image = "sprites/menu/large_crate_menu_object.png",
    scripts = menu_object_crate_defaults["scripts"],
    draw_script = menu_object_crate_defaults["draw_script"],
    recipe_tab = menu_object_crate_defaults["recipe_tab"],
    recipe = menu_object_crate_defaults["recipe"],
    recipe_amount = menu_object_crate_defaults["recipe_amount"]
}


menu_objects_to_define = {
    {
        id = "honeycomb_crate_large",
        name = "Large Honeycomb Crate",
        category = menu_object_crate_large_defaults["category"],
        tooltip = "A large crate made of honeycomb. Holds 24 stacks.",
        shop_key = menu_object_crate_large_defaults["shop_key"],
        shop_buy = 15,
        shop_sell = 30,
        layout = menu_object_crate_large_defaults["layout"],
        info = menu_object_crate_large_defaults["info"],
        buttons = menu_object_crate_large_defaults["buttons"],
        machines = menu_object_crate_large_defaults["machines"],
        tools = menu_object_crate_large_defaults["tools"],
        nature = menu_object_crate_large_defaults["nature"],
        aquatic = menu_object_crate_large_defaults["aquatic"],
        deep = menu_object_crate_large_defaults["deep"],
        singular = menu_object_crate_large_defaults["singular"],
        invisible = menu_object_crate_large_defaults["invisible"],
        center = menu_object_crate_large_defaults["center"],
        item_sprite = menu_object_crate_large_defaults["item_sprite"],
        sprite_image = "sprites/furniture/honeycomb_large_crate_object.png",
        menu_image = "sprites/menu/large_crate_menu_object.png",
        scripts = menu_object_crate_large_defaults["scripts"],
        draw_script = menu_object_crate_large_defaults["draw_script"],
        recipe_tab = menu_object_crate_large_defaults["recipe_tab"],
        recipe = {
            { item = "honeycomb", amount = 20 },
            { item = "beeswax", amount = 10 }            
        },
        recipe_amount = menu_object_crate_large_defaults["recipe_amount"],
        npc_special = false
    },
    {
        id = "honeycomb_crate_small",
        name = "Small Honeycomb Crate",
        category = menu_object_crate_small_defaults["category"],
        tooltip = "A small crate made of honeycomb. Holds 12 stacks.",
        shop_key = menu_object_crate_small_defaults["shop_key"],
        shop_buy = 10,
        shop_sell = 20,
        layout = menu_object_crate_small_defaults["layout"],
        info = menu_object_crate_small_defaults["info"],
        buttons = menu_object_crate_small_defaults["buttons"],
        machines = menu_object_crate_small_defaults["machines"],
        tools = menu_object_crate_small_defaults["tools"],
        nature = menu_object_crate_small_defaults["nature"],
        aquatic = menu_object_crate_small_defaults["aquatic"],
        deep = menu_object_crate_small_defaults["deep"],
        singular = menu_object_crate_small_defaults["singular"],
        invisible = menu_object_crate_small_defaults["invisible"],
        center = menu_object_crate_small_defaults["center"],
        item_sprite = menu_object_crate_small_defaults["item_sprite"],
        sprite_image = "sprites/furniture/honeycomb_small_crate_object.png",
        menu_image = "sprites/menu/large_crate_menu_object.png",
        scripts = menu_object_crate_small_defaults["scripts"],
        draw_script = menu_object_crate_small_defaults["draw_script"],
        recipe_tab = menu_object_crate_small_defaults["recipe_tab"],
        recipe = {
            { item = "honeycomb", amount = 15 },
            { item = "beeswax", amount = 5 }        
        },
        recipe_amount = menu_object_crate_small_defaults["recipe_amount"],
        npc_special = false
    }    
}

function define_menu_objects(table_of_menu_objects)

    local function_name = "define_menu_objects"
    local function_status = "Success"

    if #table_of_menu_objects ~= 0 then
        for menu_object=1, #table_of_menu_objects do
            local api_define_menu_object_status = api_define_menu_object(
                {
                    id = table_of_menu_objects[menu_object]["id"],
                    name = table_of_menu_objects[menu_object]["name"],
                    category = table_of_menu_objects[menu_object]["category"],
                    tooltip = table_of_menu_objects[menu_object]["tooltip"],
                    shop_key = table_of_menu_objects[menu_object]["shop_key"],
                    shop_buy = table_of_menu_objects[menu_object]["shop_buy"],
                    shop_sell = table_of_menu_objects[menu_object]["shop_sell"],
                    layout = table_of_menu_objects[menu_object]["layout"],
                    info = table_of_menu_objects[menu_object]["info"],
                    buttons = table_of_menu_objects[menu_object]["buttons"],
                    machines = table_of_menu_objects[menu_object]["machines"],
                    tools = table_of_menu_objects[menu_object]["tools"],
                    nature = table_of_menu_objects[menu_object]["nature"],
                    aquatic = table_of_menu_objects[menu_object]["aquatic"],
                    deep = table_of_menu_objects[menu_object]["deep"],
                    singular = table_of_menu_objects[menu_object]["singular"],
                    invisible = table_of_menu_objects[menu_object]["invisible"],
                    center = table_of_menu_objects[menu_object]["center"],
                    item_sprite = table_of_menu_objects[menu_object]["item_sprite"]
                },
                table_of_menu_objects[menu_object]["sprite_image"],
                table_of_menu_objects[menu_object]["menu_image"],
                table_of_menu_objects[menu_object]["scripts"],
                table_of_menu_objects[menu_object]["draw_script"]

            )

            mod_log_status(api_define_menu_object_status, function_name, "defining " .. table_of_menu_objects[menu_object]["name"] .. " menu object.")
            if api_define_menu_object_status ~= "Success" then function_status = nil end

            local menu_object_id = construct_id(table_of_menu_objects[menu_object]["id"])
            
            local define_recipe_menu_object_status = api_define_recipe(
                table_of_menu_objects[menu_object]["recipe_tab"],
                menu_object_id,
                table_of_menu_objects[menu_object]["recipe"],
                table_of_menu_objects[menu_object]["recipe_amount"]
            )

            mod_log_status(define_recipe_menu_object_status, function_name, "defining " .. table_of_menu_objects[menu_object]["name"] .. " recipe.")
            if define_recipe_menu_object_status ~= "Success" then function_status = nil end
            
            if table_of_menu_objects[menu_object]["npc_special"] ~= true then
                table.insert(furniture_items, construct_id(table_of_menu_objects[menu_object]["id"]))               
            end


        end

    end

    return mod_log_status(function_status, function_name, "defining menu objects or recipes.")

end