MOD_NAME = "honeycomb_furniture"
MOD_NAME_FRIENDLY = "Honeycomb Furniture"
MOD_SAVE_DATA = {}
DEV_MODE_ENABLED = false
LOGGING_SUCCESSES_ENABLED = false
LOGGING_FAILURES_ENABLED = false
LOGGING_INFO_ENABLED = false

----------------------------------------------------
-- REGISTER MOD
----------------------------------------------------

function register()

    return {
      name = MOD_NAME,
      hooks = {"data", "key", "ready", "save"}, 
      modules = {"bees", "items", "objects", "mdata", "npcs", "quests", "utilities"} 
    }

end

----------------------------------------------------
-- INITIATE MOD
----------------------------------------------------

function init() 

  -- Get save DATA
  api_get_data()
  
  -- Set Dev Mode Preference Based on Global Config
  set_dev_mode()

  -- Define Items
  define_items()
  
  -- Define Furniture
  define_furniture()

  -- Define NPCs
  define_npcs()

  -- Define Bees
  define_bees()

  -- Define Quests
  define_quests(quest_gifs, quests)

  -- Return "Success" To Load Mod
  return "Success"

end

----------------------------------------------------
-- READY
----------------------------------------------------

function ready()

  -- Create Darbee NPC if he doesn't exist.
  create_npc("npc325")

  -- Unlock the first quest.
  unlock_first_quest()

  return "Success"
end

----------------------------------------------------
-- KEY
----------------------------------------------------
key_f5 = 116

function key(key_code)

  if key_code == key_f5 then

    -- Rotate Darbee's shop stock when F5 is pressed.
    if api_get_property(
      api_get_property(
          api_get_menu_objects(nil, "npc325")[1]["menu_id"],
          "shop"
      ),
      "open"
    ) == true then
        rotate_darbee_stock("npc325", shop_stock_darbee)
      return "Success"
    end

  end

end

----------------------------------------------------
-- DATA AND SAVES
----------------------------------------------------

function save()
  mod_log_info("mod.save", "Save called.")
  MOD_SAVE_DATA["times_saved"] = MOD_SAVE_DATA["times_saved"] + 1
  api_set_data(MOD_SAVE_DATA)
end

function data(event, event_data)
  if event == "LOAD" then
    if event_data ~= nil then
      MOD_SAVE_DATA = event_data
      QUEST_PROGRESS = event_data["quest_progress"]
      mod_log_info("mod.data.Load: Complete - ", MOD_SAVE_DATA)
      mod_log_info("mod.data.Load: Complete - ", get_table_length(QUEST_PROGRESS))
      -- Add unlocked recipes to workbench based on quest progress
      mod_load_recipe_check()
    else
      first_load()
    end
  end

  if event == "SAVE" and event_data ~= nil then
    mod_log_info("mod.data.Save: Complete - ", MOD_SAVE_DATA)
  end

end