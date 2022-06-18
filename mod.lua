MOD_NAME = "honeycomb_furniture"
MOD_NAME_FRIENDLY = "Honeycomb Furniture"
DEV_MODE_ENABLED = true
LOGGING_SUCCESSES_ENABLED = true
LOGGING_FAILURES_ENABLED = true

----------------------------------------------------
-- REGISTER MOD
----------------------------------------------------

function register()

    return {
      name = MOD_NAME,
      hooks = {}, 
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