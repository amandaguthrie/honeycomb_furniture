local module_object_name = "npcs"

function define_npcs()
    local function_name = module_object_name .. ".define_npcs"
    local function_status = "Success"
    local log_message = "defining NPCs."

    define_darbee_status = define_darbee()
    if define_darbee_status ~= "Success" then function_status = nil end

    return mod_log_status(function_status, function_name, log_message)

end

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
            specials = {"honeycomb","beeswax","propolis"},
            stock = {"log","log","log"},
            greeting = "It's a bee-autiful day for furniture shopping.",
            dialogue = {"My grandpoppy taught me how to make honeycomb furniture.","It's fulfilling carrying on family traditions."},
            walking = true,
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