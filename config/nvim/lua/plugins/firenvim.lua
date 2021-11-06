local blacklistedSites = { ".*twitch\\.tv.*", ".*twitter\\.com.*" }

local localSettings = {
    [".*"] = {
        cmdline = "neovim",
    },
}
for _, site in pairs(blacklistedSites) do
    localSettings[site] = { takeover = "never" }
end

vim.g.firenvim_config = {
    localSettings = localSettings,
}
