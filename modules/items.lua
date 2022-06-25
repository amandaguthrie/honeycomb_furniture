local module_object_name = "items"

local item_definitions = {
    {
        item_definition = {
            id = "sturdy_honeycomb",
            name = "Sturdy Honeycomb",
            category = "",
            tooltip = "Honeycomb, but sturdier.",
            shop_key = false,
            shop_buy = 1,
            shop_sell = 0.2,
            machines = nil,
            -- placeable = false,
            -- place_grass = false,
            -- place_water = false,
            -- place_deep = false,
            singular = false,
            durability = nil,
            -- obj = nil,
            honeycore = false,
            bee_lore = "The architectural innovation of this honeycomb is a true feat of apicultural engineering."
        },
        sprite_image = "sprites/item/sturdy_honeycomb_item.png"
    }
}

--- Define mod items.
function define_items()
    local function_name = module_object_name .. ".define_items: "
    local function_status = "Success"

    if #item_definitions ~= 0 then
        for item=1, #item_definitions do
            local define_item_status = api_define_item(
                item_definitions[item]["item_definition"],
                item_definitions[item]["sprite_image"]
            )

            mod_log_status(define_item_status, function_name, " defining item " .. item_definitions[item]["item_definition"]["id"])

            if define_item_status ~= "Success" then function_status = nil end
        end
    end
    mod_log_status(function_status, function_name, " defining items.")
end