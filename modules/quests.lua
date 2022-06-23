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
            reqs = {"honeycomb@10"}, -- item_oid@qty
            icon = "npc325", -- item oid
            reward = "npc325@1", -- item_oid@qty
            unlock = {}, --quest IDs to unlock when completed
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
    }
}

function define_quests(quest_gif_list, quest_list)
    local function_name = module_object_name .. " define_quests:"
    local function_status = "Success"

    if #quest_gif_list ~= 0 then
        for gif=1, #quest_gif_list do
            local gif_definition_status = api_define_gif(quest_gif_list[gif]["gif_name"], quest_gif_list[gif]["gif_location"], quest_gif_list[gif]["gif_frames"])
            mod_log_status(gif_definition_status, function_name, " defining " .. quest_gif_list[gif]["gif_name"])
            if gif_definition_status ~= "Success" then function_status = nil end
        end
    end

    if #quest_list ~= 0 then
        for quest=1, #quest_list do
            local quest_definition_status = api_define_quest(quest_list[quest]["quest_definition"], quest_list[quest]["left_page"], quest_list[quest]["right_page"])
            mod_log_status(quest_definition_status, function_name, " defining " .. quest_list[quest]["quest_definition"]["title"])
            if quest_definition_status ~= "Success" then function_status = nil end
        end

        mod_log_status(function_status, function_name, " defining quest gifs or quests.")
    end
end

function unlock_first_quest()
    local function_name = module_object_name .. " unlock_first_quest:"

    local unlock_quest_status = api_unlock_quest("hf_quest_1")

    mod_log_status(unlock_quest_status, function_name, " unlocking the first quest.")
end