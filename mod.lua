MOD_NAME = "honeycomb_furniture"
MOD_NAME_FRIENDLY = "Honeycomb Furniture"
DEV_MODE_ENABLED = true
LOGGING_SUCCESSES_ENABLED = true
LOGGING_FAILURES_ENABLED = true
LOGGING_INFO_ENABLED = false

----------------------------------------------------
-- REGISTER MOD
----------------------------------------------------

function register()

    return {
      name = MOD_NAME,
      hooks = {"key"}, 
      modules = {"objects", "menus", "npcs", "utilities"} 
    }

end

----------------------------------------------------
-- INITIATE MOD
----------------------------------------------------

function init() 
  
  -- Set Dev Mode Preference Based on Global Config
  set_dev_mode()

  -- Create Furniture
  define_furniture()

  -- Define NPCs
  define_npcs()

  -- Return "Success" To Load Mod
  return "Success"

end

----------------------------------------------------
-- KEY
----------------------------------------------------
key_f5 = 116

function key(key_code)

  if key_code == key_f5 then

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