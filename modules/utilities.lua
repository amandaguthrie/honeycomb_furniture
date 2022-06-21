local module_object_name = "utilities"

----------------------------------------------------
-- SET DEV MODE BASED ON GLOBAL
----------------------------------------------------

function set_dev_mode()

    if DEV_MODE_ENABLED == true then 
        api_set_devmode(true)
        api_define_command(
            "/honeycomb_one_of_everything",
            "gimme_one_of_everything"
        )
        -- NPCs cannot be deleted via bin. This allows devs to do this for testing. Place the NPC on the map and then run the command.
        api_define_command(
            "/destroy_npc",
            "destroy_npc"
        )
    end
    
end

----------------------------------------------------
-- STANDARD SUCCESS/NIL WITH LOGGING OPTIONS
----------------------------------------------------

-- Check a resource's completion status, log based on that status, and return the status. Should only be used for functions that return "Success".
---@param resource function The result of a function that passes back success/nil.
---@param module table The module that the event ran.
---@param message string The error message to be returned. Automatically prepended with "Success " or "Failure " to save time writing error messages.
---
function mod_log_status(resource, module, message)

    if resource == "Success" then 
        
        if LOGGING_SUCCESSES_ENABLED == true then
            api_log(module, "Success " .. message)
        end

        return "Success"

    else

        if LOGGING_FAILURES_ENABLED == true then
            api_log(module, "Failure " .. message)
        end

        return nil
    end

end

----------------------------------------------------
-- LOG INFO
----------------------------------------------------

-- General information logging controlled by global LOGGING_INFO_ENABLED.
---@param module table The module that the event ran.
---@param message string The error message to be returned.
---
function mod_log_info(module, message)

    if LOGGING_INFO_ENABLED == true then
        api_log(module, message)
    end

    return nil

end

----------------------------------------------------
-- CONSTRUCT OBJECT ID
----------------------------------------------------

-- Construct an OID from the global MOD_NAME and an untransformed ID. Returns the full OID as a string.
---@param untransformed_id string The object ID without the mod name prepended.
--
function construct_id(untransformed_id)

    return MOD_NAME .. "_" .. untransformed_id

end

----------------------------------------------------
-- ITERATE ELEMENTS IN A LIST
----------------------------------------------------

function iterate_elements(element_collection)

    local index = 0
    local count = #element_collection

    return function()
        index = index + 1

        if index <= count then
            return collection[index]
        end

    end

end

----------------------------------------------------
-- DEV MODE HELPERS
----------------------------------------------------


-- Give player one of each item. Useful during testing.
---@param untransformed_id string The object ID without the mod name prepended.
--- 
function gimme_one_of_everything()

    api_give_item(construct_id("honeycomb_bookshelf"), 1)
    api_give_item(construct_id("honeycomb_trophyshelf"), 1)
    api_give_item(construct_id("honeycomb_table"), 1)
    api_give_item(construct_id("bee_plush_happy"), 1)
    api_give_item(construct_id("honeycomb_crate_large"), 1)
    api_give_item(construct_id("honeycomb_crate_small"), 1)

end

-- Destroy an NPC by its OID since NPCs can't be deleted via bin. 
---@param args string The OID of the NPC to destroy all active instances of.
function destroy_npc(args)
    npc_all_objects = api_all_menu_objects(args[1])

    for npc=0, #npc_all_objects do
        api_destroy_inst(npc_all_objects[npc])
    end

end


-- * This is functional but slowed down game loading. Maybe only pull when bookshelf is placed?

-- function get_player_stats()

--     player = api_get_player_instance()
--     player_stats = api_get_property(player, "stats")

--     player_stats_steps_walked = player_stats["steps_walked"]
--     player_stats_steps_waded = player_stats["steps_waded"]
--     player_stats_steps_sailed = player_stats["steps_sailed"]
--     player_stats_naps_taken = player_stats["naps_taken"]
--     player_stats_trees_chopped = player_stats["trees_chopped"]
--     player_stats_trees_planted = player_stats["trees_planted"]

--     player_stats_birbs_scared = player_stats["birbs_scared"]

-- end
