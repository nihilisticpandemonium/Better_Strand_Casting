local intermediatemulti = angelsmods.marathon.intermediatemulti

local roll_recipes = {
    "roll-aluminium-casting",
    "roll-copper-casting",
    "roll-iron-casting",
    "roll-titanium-casting",
    "angels-roll-steel-casting",
    "roll-solder-casting"
}
local coil_recipes = {
    "angels-wire-coil-tin-casting",
    "angels-wire-coil-gold-casting",
    "angels-wire-coil-silver-casting",
}

if mods["CircuitProcessing"] then
    -- add chrome roll casting, unrolling
    data:extend({
        {
            type = "recipe",
            name = "roll-chrome-casting",
            category = "strand-casting",
            subgroup = "angels-chrome-casting",
            normal = {
                enabled = "false",
                energy_required = 4,
                ingredients = {
                    {type = "fluid", name = "liquid-molten-chrome", amount = 80},
                    {type = "fluid", name = "water", amount = 40}
                },
                results = {{type = "item", name = "angels-roll-chrome", amount = 2}}
            },
            expensive = {
                enabled = "false",
                energy_required = 4,
                ingredients = {
                    {type = "fluid", name = "liquid-molten-chrome", amount = 100 * intermediatemulti},
                    {type = "fluid", name = "water", amount = 40}
                },
                results = {{type = "item", name = "angels-roll-chrome", amount = 2}}
            },
            icons = {
                {
                    icon = "__angelssmelting__/graphics/icons/roll-chrome.png"
                },
                {
                    icon = "__angelsrefining__/graphics/icons/num_1.png",
                    tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
                    scale = 0.32,
                    shift = {-12, -12}
                }
            },
            icon_size = 32,
            order = "ca"
        },
        {
            type = "recipe",
            name = "roll-chrome-casting-fast",
            category = "strand-casting",
            subgroup = "angels-chrome-casting",
            normal = {
                enabled = "false",
                energy_required = 2,
                ingredients = {
                    {type = "fluid", name = "liquid-molten-chrome", amount = 140},
                    {type = "fluid", name = "liquid-coolant", amount = 40, maximum_temperature = 50}
                },
                results = {
                    {type = "item", name = "angels-roll-chrome", amount = 4},
                    {type = "fluid", name = "liquid-coolant-used", amount = 40, temperature = 300}
                },
                main_product = "angels-roll-chrome"
            },
            expensive = {
                enabled = "false",
                energy_required = 2,
                ingredients = {
                    {type = "fluid", name = "liquid-molten-chrome", amount = 180 * intermediatemulti},
                    {type = "fluid", name = "liquid-coolant", amount = 40, maximum_temperature = 50}
                },
                results = {
                    {type = "item", name = "angels-roll-chrome", amount = 4},
                    {type = "fluid", name = "liquid-coolant-used", amount = 40, temperature = 300}
                },
                main_product = "angels-roll-chrome"
            },
            icons = {
                {
                    icon = "__angelssmelting__/graphics/icons/roll-chrome.png"
                },
                {
                    icon = "__angelsrefining__/graphics/icons/num_2.png",
                    tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
                    scale = 0.32,
                    shift = {-12, -12}
                }
            },
            icon_size = 32,
            order = "cb"
        },
        {
            type = "recipe",
            name = "angels-roll-chrome-converting",
            category = "advanced-crafting",
            subgroup = "angels-chrome-casting",
            energy_required = 0.5,
            enabled = "false",
            allow_decomposition = false,
            ingredients = {
                {type = "item", name = "angels-roll-chrome", amount = 1}
            },
            results = {
                {type = "item", name = "angels-plate-chrome", amount = 4}
            },
            icons = {
                {
                    icon = "__angelssmelting__/graphics/icons/plate-chrome.png"
                },
                {
                    icon = "__angelssmelting__/graphics/icons/roll-chrome.png",
                    scale = 0.4375,
                    shift = {-10, -10}
                }
            },
            icon_size = 32,
            order = "cc"
        }
    })
    bobmods.lib.tech.add_recipe_unlock("angels-chrome-smelting-2", "roll-chrome-casting")
    bobmods.lib.tech.add_recipe_unlock("angels-chrome-smelting-2", "angels-roll-chrome-converting")
    bobmods.lib.tech.add_recipe_unlock("angels-chrome-smelting-3", "roll-chrome-casting-fast")
    roll_recipes[#roll_recipes+1] = "roll-chrome-casting"
end


for _, recipe_name in pairs(roll_recipes) do
    data.raw["recipe"][recipe_name].normal.ingredients[1].amount = 70
    data.raw["recipe"][recipe_name].expensive.ingredients[1].amount = 85 * intermediatemulti
    data.raw["recipe"][recipe_name .. "-fast"].normal.ingredients[1].amount = 120
    data.raw["recipe"][recipe_name .. "-fast"].expensive.ingredients[1].amount = 150 * intermediatemulti
end

for _, recipe_name in pairs(coil_recipes) do
    data.raw["recipe"][recipe_name .. "-fast"].normal.ingredients[1].amount = 60
    data.raw["recipe"][recipe_name .. "-fast"].normal.ingredients[2].amount = 60
    data.raw["recipe"][recipe_name .. "-fast"].expensive.ingredients[1].amount = 75 * intermediatemulti
    data.raw["recipe"][recipe_name .. "-fast"].expensive.ingredients[2].amount = 75 * intermediatemulti
end

data.raw["recipe"]["angels-wire-coil-copper-casting-fast"].normal.ingredients[1].amount = 120
data.raw["recipe"]["angels-wire-coil-copper-casting-fast"].expensive.ingredients[1].amount = 150 * intermediatemulti
