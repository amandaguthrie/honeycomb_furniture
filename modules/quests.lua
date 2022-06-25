local module_object_name = "quests"

quest_gifs = {
    -- {
    --     gif_name = "",
    --     gif_location = "sprites/quests/.png",
    --     gif_frames = 0,
    --     height = 46
    -- }
}

quests = {
    {
        quest_definition = {
            id = "hf_quest_1",
            title = "HF: Meet Darbee",
            reqs = {"honeycomb@15"}, -- item_oid@qty
            icon = "npc325", -- item oid
            reward = "npc325@1", -- item_oid@qty
            unlock = {"hf_quest_2"}, --quest IDs to unlock when completed
            unlocked = false
        },
        left_page = {
            { 
                text = "Hi, I'm Darbee! It's nice to meet you."
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
                text = "\n"
            },
            {
                text = "I heard you're revitalizing the bee population?"
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
                text = "\n"
            },
            {
                text = "My family used heirloom techniques to design and build furniture out of honeycomb."
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
                text = "\n"
            },
            {
                text = "Unfortunately, honeycomb has been scarce around these parts for years."
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            }
        },
        right_page = {
            { -- line 1
                text = "If you could bring me 10 honeycomb, I'll move back and share my techniques."
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            }
        },
        claim_script = nil
    },
    {
        quest_definition = {
            id = "hf_quest_2",
            title = "HF: A Constructive Bee",
            reqs = {"bee:builder@1"}, -- item_oid@qty
            icon = "bee", -- item m oid
            reward = "honeycomb_furniture_sturdy_honeycomb@10", -- item_oid@qty
            unlock = {"hf_quest_3"}, --quest IDs to unlock when completed
            unlocked = false
        },
        left_page = {
            { 
                text = "Thank you so much for the honeycomb!"
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
                text = "\n"
            },
            {
                text = "I used the honeycomb to make a small crate, but it turned out rather squishy. They didn't used to when I made them."

            },
            {
                text = "\n"
            },
            {
                text = "I remember something about a bee that makes stronger honeycomb. How did the saying go?"
            },
            {
                text = "\n"
            },
            {
                text = "'One bee of old and one of grit, breed a bee that just won't quit.'"
            }
        },
        right_page = {
            { -- line 1
                text = "I wonder what happens if you breed a bee that works hard and a bee from a long time ago."
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
            text = "/n"
            },
            {
            text = "Could you bring me one of what you discover?"
            }       
        },
        claim_script = nil
    },
    {
        quest_definition = {
            id = "hf_quest_3",
            title = "HF: Sturdier Resources",
            reqs = {"honeycomb_furniture_sturdy_honeycomb@20"}, -- item_oid@qty
            icon = "honeycomb_furniture_sturdy_honeycomb", -- item oid
            reward = "honeycomb_furniture_honeycomb_crate_large@1", -- item_oid@qty
            unlock = {}, --quest IDs to unlock when completed
            unlocked = false
        },
        left_page = {
            { 
                text = "Wow, I'm so happy you found the Builder Bee!"
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
                text = "\n"
            },
            {
                text = "Have you seen what kind of special produce it makes?"

            },
            {
                text = "\n"
            },
            {
                text = "If it's the stronger honeycomb I'm thinking of, it'll be a darker color than regular honeycomb."
            },
            {
                text = "\n"
            }
        },
        right_page = {
            { -- line 1
                text = "Could you bring me 20 of what you discover?"
                -- color = "", -- text color
                -- gif = "", -- gif location
                -- width = "" -- for gif
            },
            {
            text = "\n"
            },
            {
            text = "If I can build a large honeycomb crate like I used to, I'll give you some recipes so you can build them yourself!"
            }
        
        },
        claim_script = "quest_three_claim"
    }
}

--- Create quest GIFs and quests. Used in mod.lua.
---@param quest_gif_list table 
---@param quest_list table A table that contains quest information for api_define_quest
function define_quests(quest_gif_list, quest_list)
    local function_name = module_object_name .. " define_quests:"
    local function_status = "Success"

    if #quest_gif_list ~= 0 then
        for gif=1, #quest_gif_list do
            local gif_definition_status = api_define_gif(
                quest_gif_list[gif]["gif_name"], 
                quest_gif_list[gif]["gif_location"], 
                quest_gif_list[gif]["gif_frames"]
            )
            mod_log_status(gif_definition_status, function_name, " defining " .. quest_gif_list[gif]["gif_name"])
            if gif_definition_status ~= "Success" then function_status = nil end
        end
    end

    if #quest_list ~= 0 then
        for quest=1, #quest_list do
            local quest_definition_status = api_define_quest(
                quest_list[quest]["quest_definition"],
                quest_list[quest]["left_page"],
                quest_list[quest]["right_page"],
                quest_list[quest]["claim_script"]
            )

            mod_log_status(quest_definition_status, function_name, " defining " .. quest_list[quest]["quest_definition"]["title"])
            if quest_definition_status ~= "Success" then function_status = nil end
        end

        mod_log_status(function_status, function_name, " defining quest gifs or quests.")
    end
end

--- Unlock the first quest. Used in mod.lua
function unlock_first_quest()
    local function_name = module_object_name .. " unlock_first_quest:"

    local unlock_quest_status = api_unlock_quest("hf_quest_1")

    mod_log_status(unlock_quest_status, function_name, " unlocking the first quest.")
end

--- Unlock menu object recipes by specifying a table of objects and a quest name they should be unlocked with upon completion.
---@param table_of_menu_objects table --- a table of menu objects and their corresponding recipes.
---@param quest_name any --- The quest name should align with a quest ID.
function unlock_crate_recipes(table_of_menu_objects, quest_name)
    local function_name = module_object_name .. ".unlock_crate_recipes: "

    mod_log_info(function_name, table_of_menu_objects[1]["unlock_recipe_after"])

    local define_menu_object_recipes_status = define_menu_object_recipes(table_of_menu_objects, quest_name)

    mod_log_status(define_menu_object_recipes_status, function_name, " defining crate recipes.")

    if define_menu_object_recipes_status == "Success" then
        for menu_object = 1, #table_of_menu_objects do
            local menu_object_oid = construct_id(table_of_menu_objects[menu_object]["id"])
            api_set_notification("workbench", menu_object_oid, "Unlocked crate recipes.", "Check the mod workbench.")
        end

    end
end

--- Unlock object recipes by specifying a table of objects and a quest name they should be unlocked with upon completion.
---@param table_of_objects table --- a table of objects with their recipe definitions.
---@param quest_name string --- The quest name should align with a quest ID.
function unlock_object_recipes(table_of_objects, quest_name)
    local function_name = module_object_name .. ".unlock_object_recipes: "

    local define_object_recipes_status = define_object_recipes(table_of_objects, quest_name)

    mod_log_status(define_object_recipes_status, function_name, " defining furniture recipes.")

    if define_object_recipes_status == "Success" then
        for object = 1, #table_of_objects do
            local object_oid = construct_id(table_of_objects[object]["id"])
            api_set_notification("workbench", object_oid, "Unlocked furniture recipes.", "Check the mod workbench.")
        end

    end

end 

--- Unlock crate and object recipes after quest three
function quest_three_claim()
    unlock_crate_recipes(crate_menu_objects_to_define, "hf_quest_3")
    unlock_object_recipes(objects_to_define, "hf_quest_3")
end