local module_object_name = "mdata"

function first_load()
    local function_name = module_object_name .. ".first_load: "
    MOD_SAVE_DATA["times_saved"] = 0
    MOD_SAVE_DATA["quest_progress"] = {}
    populate_quest_data(quests, MOD_SAVE_DATA)
    mod_log_info(function_name .. "MOD_SAVE_DATA: ", MOD_SAVE_DATA)
    api_set_data(MOD_SAVE_DATA)
end

--- Generate initial quest progress ID/completion lists for save file
---@param quests_to_add table --- Table of quest definitions
---@param where_to_add table --- Which variable to add the table to
function populate_quest_data(quests_to_add, where_to_add)
    mod_log_info("mdata.populate: Beginning - ", where_to_add)
    local function_name = module_object_name .. ".populate_quest_data: "

    if #quests_to_add ~= 0 then
        for quest=1, #quests_to_add do
        
            local quest_id = quests_to_add[quest]["quest_definition"]["id"]
            -- mod_log_info(function_name .. "quest_id: ", quest_id)
            local quest_row = {completed = false}

            if where_to_add["quest_progress"][quest] == quest_id then
                -- mod_log_info(function_name, "The where_to_add table has the quest ID already.")
                -- mod_log_info(function_name .. "where_to_add.quest_id: ", where_to_add["quest_progress"][quest_id]["completed"])
            else
                -- mod_log_info(function_name, "The where_to_add table doesn't have the quest already.")
                -- where_to_add["quest_progress"] = quest_id
                where_to_add["quest_progress"][quest_id] = "incomplete"
                -- mod_log_info(function_name .. "where_to_add.quest_id: ", where_to_add["quest_progress"][quest_id])
            end

        end
        -- mod_log_info(function_name .. "construct_quest_progress: ", where_to_add)
        -- mod_log_info(function_name .. "construct_quest_progress: ", where_to_add["hf_quest_1"])
    end
    -- mod_log_info("mdata.populate: Complete - ", where_to_add)
end
