darbee_stock_index = 1

local module_object_name = "npcs"

----------------------------------------------------
-- NPC MENU DEFAULTS
----------------------------------------------------
dialogue_sprite = "sprites/menu/npc_dialogue_menu.png"
shop_sprite = "sprites/menu/npc_shop_menu.png"

----------------------------------------------------
-- CREATE NPCS
----------------------------------------------------


function define_npcs()
    local function_name = module_object_name .. ".define_npcs"
    local function_status = "Success"
    local log_message = "defining NPCs."

    mod_log_info(module_object_name .. "Furniture Items: ", furniture_items )
    
    mod_log_info(module_object_name .. "Furniture Items #: ", #furniture_items )

    define_stock_status = set_shop_stock(furniture_items)
    mod_log_status(define_stock_status, function_name, "defining Darbee's stock list.")

    define_darbee_status = define_darbee()
    if define_darbee_status ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end

----------------------------------------------------
-- NPC DEFINITIONS
----------------------------------------------------

-- * DARBEE * --

function define_darbee()

    local function_name = module_object_name .. ".define_darbee"
    local function_status = "Success"
    local log_message = "defining Darbee NPC."

    local define_darbee_status = api_define_npc(
        {
            id = 325,
            name = "Darbee",
            pronouns = "he/him",
            tooltip = "What's the buzz?",
            specials = {construct_id("bee_plush_happy"), construct_id("bee_plush_happy"), construct_id("bee_plush_happy")},
            stock = shop_stock_darbee[darbee_stock_index],
            greeting = "It's a bee-autiful day for furniture shopping.",
            dialogue = {"My grandpoppy taught me how to make honeycomb furniture.","It's fulfilling carrying on family traditions."},
            walking = false,
            shop = true
        },
        "sprites/npc/darbee_standing.png",
        "sprites/npc/darbee_standing_h.png",
        "sprites/npc/darbee_walking.png",
        "sprites/npc/darbee_walking_h.png",
        "sprites/npc/darbee_head.png",
        "sprites/npc/darbee_bust.png",
        "sprites/npc/darbee_item.png", 
        dialogue_sprite,
        shop_sprite
    )

    return mod_log_status(define_darbee_status, function_name, log_message)


end

----------------------------------------------------
-- CREATE NPCs
----------------------------------------------------

--- Check if an NPC exists on the map or in the player's inventory. If there is not an active instance or an item in the player's inventory, give the player the NPC item to place where they wish.
---@param npc_oid string The OID of the NPC that should be created.
---
function create_npc(npc_oid)

    -- Get all of the menu objects for a given NPC OID. We don't need the full NPC object information, only the IDs.
    npc_all_objects = api_all_menu_objects(npc_oid)


    -- If there is more than one NPC menu object active in the world, remove the extras
    if #npc_all_objects > 1 then
        
        for npc=2, #npc_all_objects do
            mod_log_info(module_object_name .. '.create_npc >1 npc_all_objects[npc]', npc_all_objects[npc])
            api_destroy_inst(npc_all_objects[npc])
        end

    end

    -- Changed this out for Meet Darbee intro quest.

    -- -- If no NPC menu objects exist, spawn the NPC as an item into the player's inventory
 
    -- elseif #npc_all_objects == 0 then

    --     player = api_get_player_instance()
    --     player_slots = api_get_slots(player)
    --     npc_inventory_count = 0

    --     -- Don't give the player another NPC item if there's already one in their player inventory.
    --     for slot=1, #player_slots do
    --         slot_info = api_get_slot(player, slot)

    --         if slot_info["item"] == npc_oid then
    --             npc_inventory_count = npc_inventory_count + 1
    --         end
    --     end


    --     -- Give the player an NPC item that they can place where they want, rather than creating it directly on the map. 
    --     -- if npc_inventory_count == 0 then
    --     --     api_give_item(npc_oid, 1)           
    --     -- end
end
 
    
----------------------------------------------------
-- SHOP STOCK DEFINITIONS
----------------------------------------------------

shop_stock_darbee = {}


-- Generate a page of items to be included in the shop menu and add it to the shop stock table. Possibilities for future improvements: Include output table as a parameter.
---@param all_choices table The full list of items to be used to generate the stock menu for this shop.
---@param range_start integer The index to start with from the full list provided in all_choices. Reminder: starting index value is 1.
---@param number_of_items integer The number of items that are included in the shop menu. By default, this is 10.
---
function generate_stock_line(all_choices, range_start, number_of_items)

    local range_end = range_start + number_of_items
    if #all_choices <= range_end then range_end = #all_choices end

    -- mod_log_info(module_object_name .. " generate_stock_line All Choices: ", all_choices[{{range_start, range_end}}])

    local new_stock_line = {}
    table.move(all_choices, range_start, range_end, 0, new_stock_line)

    -- mod_log_info(module_object_name .. " generate_stock_line New Stock Line: ", new_stock_line)
    -- mod_log_info(module_object_name .. " generate_stock_line New Stock Line #: ", #new_stock_line)

    table.insert(shop_stock_darbee, new_stock_line)

    -- mod_log_info(module_object_name .. "Shop_Stock_Darbee: ", #shop_stock_darbee)

    return "Success"
end

-- Generate all pages for a shop menu and stock rotation. Possibilities for future improvements: Add multi-shop support. 
---@param all_choices table The full list of items to be used to generate the stock menu for this shop.
---
function set_shop_stock(all_choices)
    -- Determine number of stock inventory
    -- mod_log_info(module_object_name .. ".set_shop_stock #all_choices: ", #all_choices)
    local total_choices = #all_choices
    local items_per_stock_line = 10
    local number_of_pages = math.ceil(total_choices / items_per_stock_line)
    -- mod_log_info(module_object_name .. ".set_shop_stock Pages: ", number_of_pages)
    
    local range_start = 0
    local range_end = range_start + items_per_stock_line

    for page=1,number_of_pages do
        generate_stock_line(all_choices, range_start, items_per_stock_line)
        -- mod_log_info(module_object_name .. " set_shop_stock.pageloop range_start_before", range_start)
        range_start = range_end + 1
        -- mod_log_info(module_object_name .. " set_shop_stock.pageloop range_start_after", range_start)
        range_end = range_start + items_per_stock_line
    end

    return "Success"
end

-- Rotate to the next page of a shop's stock. Possibilities for future improvements: Add multi-shop support. Consider a second list for specials that also refreshes.
---@param npc_id string The OID of the NPC. Example: "npc325"
---@param npc_full_stock table The paged table of stock output from set_shop_stock.
---
function rotate_darbee_stock(npc_id, npc_full_stock)
    local npc_menu_object = api_get_menu_objects(nil, "npc325") -- get the menu object for the npc
    local npc_shop_id = api_get_property(npc_menu_object[1]["menu_id"], "shop") 
    
    if npc_shop_id ~= nil then

        local npc_shop_slots = api_get_slots(npc_shop_id) -- get all of the shop's menu slots
        -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots", npc_shop_slots)

        if darbee_stock_index == #npc_full_stock then -- if the stock index is already the maximum lines available in the full stock then reset to 1 for next time

            -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots darbee_stock_index_before", darbee_stock_index)
            darbee_stock_index = 1
            -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots darbee_stock_index_after", darbee_stock_index)

        else -- otherwise add 1 to the stock index for next time

            darbee_stock_index = darbee_stock_index + 1
            -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots darbee_stock_index_after", darbee_stock_index)

        end

        -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_full_stock: ", npc_full_stock)

        for slot=2,11 do -- shop menus start at slot 2, slot 1 is the specials slot

            if npc_full_stock[darbee_stock_index][slot-1] ~= nil then -- the stock menu starts at 1 so we need to remove 1 from the index for each item
                -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots loop npc_full_stock: ", npc_full_stock[darbee_stock_index][slot-1])
                -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots loop before", npc_shop_slots[slot])
                api_slot_set(npc_shop_slots[slot]["id"], npc_full_stock[darbee_stock_index][slot-1], 0)

            else -- clear slots that don't have an item for that index on the current page
                -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots loop clear before", npc_shop_slots[slot])
                api_slot_clear(npc_shop_slots[slot]["id"])

            end

        end

        -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots darbee_stock_index", darbee_stock_index)
        -- mod_log_info(module_object_name .. ".rotate_darbee_stock npc_shop_slots npc_full_stock #", #npc_full_stock)

    end
end

