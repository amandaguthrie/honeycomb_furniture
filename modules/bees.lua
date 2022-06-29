local module_object_name = "bees"
local hf_bees = {}
local item_sturdy_honeycomb_oid = construct_id("sturdy_honeycomb")

local bee_definitions = {
    {
        bee_definition = {
            id = "builder",
            title = "Builder",
            latin = "Apis Architectus",
            hint = "Maybe Darbee knows something",
            desc = "The 'Builder' bee is a steady and enterprising artisan. The engineers of the bee world, they construct sturdier honeycomb than their peers, making it a prized resource used in buildings and furniture.",
            lifespan = {"Short","Normal"},
            productivity = {"Fastest", "Brisk"},
            fertility = {"Unlucky", "Fertile"},
            stability = {"Stable", "Ordered"},
            behaviour = {"Diurnal", "Nocturnal"},
            climate = {"Any"},
            rainlover = true,
            snowlover = true,
            grumpy = false,
            produce = item_sturdy_honeycomb_oid,
            chance = 1,
            requirement = "",
            bid = "BB",
            calming = {},
            tier = 3
        },
        sprite_image = "sprites/bee/builder_bee_item.png",
        shiny_image = "sprites/bee/builder_bee_shiny.png",
        hd_image = "sprites/bee/builder_bee_hd.png",
        bee_color = {r=118, g=44, b=50},
        mag_image = "sprites/bee/builder_bee_mag.png",
        mag_headline = "Builder Bee steamrolling back from extinction.",
        mag_body = "They hammered out a plan resulting in a riveting ending. What will bee built next?"
    }
}

local bee_recipe_definitions = {
    {
        "worker",
        "jurassic",
        "builder",
        "mutation_chance"
    }
}

function define_bees()

    local function_name = module_object_name .. ".define_bees:"
    local function_status = "Success"

    if #bee_definitions ~= 0 then
        for bee=1, #bee_definitions do
            local define_bee_status = api_define_bee(
                bee_definitions[bee]["bee_definition"],
                bee_definitions[bee]["sprite_image"],
                bee_definitions[bee]["shiny_image"],
                bee_definitions[bee]["hd_image"],
                bee_definitions[bee]["bee_color"],
                bee_definitions[bee]["mag_image"],
                bee_definitions[bee]["mag_headline"],
                bee_definitions[bee]["mag_body"]
            )

            mod_log_status(define_bee_status, function_name, " defining " .. bee_definitions[bee]["bee_definition"]["title"])
            if define_bee_status == "Success" then
                table.insert(hf_bees, bee_definitions[bee]["bee_definition"]["id"])
            elseif define_bee_status ~= "Success" then 
                function_status = nil
            end
        end
    end

    mod_log_status(function_status, function_name, " defining bees.")
end

function mutation_chance(bee_a, bee_b, beehive)
    if (bee_a == "worker" and bee_b == "jurassic") or (bee_a == "jurassic" and bee_b == "worker") then
        chance = api_random(99) + 1
        if chance <= 75 then
             return true 
        end
        return false
    end
end