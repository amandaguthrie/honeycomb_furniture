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
    end
    
end

----------------------------------------------------
-- STANDARD SUCCESS/NIL WITH LOGGING OPTIONS
----------------------------------------------------

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
-- DEV MODE HELPER GIVE ONE OF EVERYTHING
----------------------------------------------------

function gimme_one_of_everything()

    api_give_item(MOD_NAME .. "_honeycomb_bookshelf", 1)
    api_give_item(MOD_NAME .. "_honeycomb_trophyshelf", 1)
    api_give_item(MOD_NAME .. "_honeycomb_table", 1)
    api_give_item(MOD_NAME .. "_bee_plush_happy", 1)
    api_give_item(MOD_NAME .. "_honeycomb_crate_large", 1)
    api_give_item(MOD_NAME .. "_honeycomb_crate_small", 1)

end

-- * Two functions below replaced by mod_log_status

-- function mod_log(module, message)
--     if LOGGING_ENABLED == true then
--         api_log(module, message)
--     end
-- end

-- function mod_check_status_success(resource)
--     if resource == "Success" then return "Success"
--     else return nil end
-- end


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
