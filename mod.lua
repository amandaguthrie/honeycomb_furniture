MOD_NAME = "honeycomb_furniture"
MOD_NAME_FRIENDLY = "Honeycomb Furniture"
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
      hooks = {"key", "ready"}, 
      modules = {"bees", "items", "objects", "npcs", "quests", "utilities"} 
    }

end

----------------------------------------------------
-- INITIATE MOD
----------------------------------------------------

function init() 
  
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