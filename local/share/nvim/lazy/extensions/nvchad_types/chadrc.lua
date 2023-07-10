---@meta

---@class ChadrcConfig
---@field   ui UIConfig
---@field   mappings MappingsTable
--- The module to be imported and merged with the default plugin settings
---@field   plugins string
--- Lazy.nvim setup opts
--- Check `:h lazy.nvim-configuration` for the exact options
---@field   lazy_nvim LazyConfig

--- UI related configuration
--- e.g. colorschemes, statusline themes, cmp themes, dashboard, some LSP ui related
---@class UIConfig
--- List of highlights group to add.
--- Should be highlights that is not a part of base46 default integrations
--- (The default is all hlgroup that can be found from `hl_override`)
--- Example
--- ```lua
---     hl_add = {
---       ["HLName"] = {fg = "red"},
---     }
--- ```
--- see https://github.com/NvChad/base46/tree/master/lua/base46/integrations
---@field hl_add HLTable
--- List of highlight groups that is part of base46 default integration that you want to change
--- ```lua
---     hl_overrde = {
---       ["HLName"] = {fg = "red"},
---     }
--- ```
--- see https://github.com/NvChad/base46/tree/master/lua/base46/integrations
---@field hl_override Base46HLGroupsList
--- see https://github.com/NvChad/base46/tree/master/lua/base46/themes for the colors of each theme
--- Also accept a special key `all` to change a base46 key to a specific color for all themes
---@field changed_themes ChangedTheme
--- A table with 2 strings, denoting the themes to toggle between.
--- One of the 2 strings must be the value of `theme` field
--- Example:
--- ```lua
---     theme_toggle = { "onedark", "one_light", },
--- ```
---@field theme_toggle ThemeName[]
--- Enable transparency or not
---@field transparency boolean
--- Theme to use.
--- You can try out the theme by executing `:Telescope themes`
--- see https://github.com/NvChad/base46/tree/master/lua/base46/themes
---@field theme ThemeName
---@field cmp NvCmpConfig
---@field telescope NvTelescopeConfig
---@field statusline NvStatusLineConfig
---@field tabufline NvTabLineConfig
---@field nvdash NvDashboardConfig
---@field cheatsheet NvCheatsheetConfig
---@field lsp NvLspConfig
--- Whether to enable LSP Semantic Tokens highlighting
---@field lsp_semantic_tokens boolean
--- List of extras themes for other plugins not in NvChad that you want to compile
---@field extended_integrations ExtendedModules[]

--- Options for stylings of nvim-cmp 
---@class NvCmpConfig
--- Whether to add colors to icons in nvim-cmp popup menu
---@field icons boolean
--- Whether to also have the lsp kind highlighted with the icons as well or not
---@field lspkind_text boolean
--- nvim-cmp style
---@field style '"default"'|'"flat_light"'|'"flat_dark"'|'"atom"'|'"atom_colored"'
--- Only has effects when the style is `default`
---@field border_color string|Base30Colors
--- Whether to have more vibrant color for the currently selected entry in the popup menu
---@field selected_item_bg "colored"|"simple"

---@class NvTelescopeConfig
--- Telescope style
---@field style '"borderless"'|'"bordered"'

---@class NvStatusLineConfig
--- statusline theme
---@field theme '"default"'|'"vscode"'|'"vscode_colored"'|'"minimal"'
--- Separator style for NvChad Statusline
---     - Only when the *theme* is `minimal`, "round" or "block" will be having effect
---@field separator_style '"default"'|'"round"'|'"block"'
--- List of modules that you overirde
--- Check https://github.com/NvChad/ui/tree/main/lua/nvchad_ui/statusline for the modules of each statusline theme
---@field overriden_modules fun(): table
--- Maximum length for the progress messages section
---@field lspprogress_len integer

--- Options for NvChad Tabufline
---@class NvTabLineConfig
--- Whether to use/load tabufline or not
---@field enabled boolean
--- If false, load tabufline on startup
--- If true, load tabufline when there is at least 2 buffers opened
---@field lazyload boolean
--- List of modules that you overirde
--- Check https://github.com/NvChad/ui/blob/v2.0/lua/nvchad_ui/tabufline/modules.lua for the list of modules
---@field overriden_modules fun(): table
--- Show numbers on tabufline buffer tabs
--- @field show_numbers boolean

---@class NvDashboardConfig
--- Whether to open dashboard on opening nvim 
---@field load_on_startup boolean
--- Your ascii art
--- Each string is one line
---@field header string[],
--- List of buttons to show on the dashboard
---@field buttons NvDashButtonConfig[]

---@class NvCheatsheetConfig
--- Cheatsheet theme
---@field theme '"grid"'|'"simple"'

---@class NvDashButtonConfig
---@field [1] string Description for the button
---@field [2] string sequence of keys to press to trigger the keybind
---@field [3] string|fun() A Vim Command/A Lua function to be triggered when pressing the keybind/pressing enter on the line with the description on the dashboard

---Options for NvChad/ui lsp configuration
---@class NvLspConfig 
---@field signature NvLspSignatureConfig Opts for showing function signatures as you type

---@class NvLspSignatureConfig
---@field disabled boolean Whether to disable this feature
---@field silent boolean Whether to hide `No signature help available` message from appearing

--- A table of mappings
---     - `disabled` is used to define the keymaps that you don't want to keep
---     - Other keys are the list of default tables that is with NvChad
---     - You can define your custom table, such as the example below
--- ```lua
--- M.mappings = {
---   ["some table name"] = {
---     -- plugin = true, -- will make this table load only when you specify it to
---     ["some vim mode"] = {
---       ["some lhs"] = {
---         "rhs of a keymap", -- this must be here. This can also be a Lua function
---         "Description for the keymap",
---         opts = {}, -- Other opts for the keymaps
---       }
---     }
---   }
--- }
--- ```
--- see lua/core/mappings.lua for more information
---@alias MappingsTable DefaultMappingsTable | table<string, KeymapsTable>

--- @class DefaultMappingsTable
--- @field disabled   DisabledTable Keymaps to be removed
--- @field general    KeymapsTable Keymaps that will be load on startup
--- @field tabufline  KeymapsTable Keymaps that will be load with NvChad's tabline
--- @field comment    KeymapsTable Keymaps for Comment.nvim
--- @field lspconfig  KeymapsTable Keymaps for nvim-lspconfig
--- @field nvimtree   KeymapsTable Keymaps for nvim-tree.lua
--- @field telescope  KeymapsTable Keymaps for telescope.nvim
--- @field nvterm     KeymapsTable Keymaps for NvChad/nvterm
--- @field whichkey   KeymapsTable Keymaps for which-key.nvim
--- @field blankline  KeymapsTable Keymaps for indent-blankline.nvim
--- @field gitsigns   KeymapsTable Keymaps for gitsigns.nvim

--- List of keymaps that is part of `core/mappings.lua` that will be removed
---@class DisabledTable 
---@field n   table<string, '""'|false> Normal Mode keymaps to remove
---@field x   table<string, '""'|false> Visual Mode keymaps to remove
---@field s   table<string, '""'|false> Select Mode keymaps to remove
---@field v   table<string, '""'|false> Visual + Select Mode keymaps to remove
---@field o   table<string, '""'|false> Operator-Pending Mode keymaps to remove
---@field i   table<string, '""'|false> Insert Mode keymaps to remove
---@field c   table<string, '""'|false> Command-Line Mode keymaps to remove
---@field l   table<string, '""'|false> Insert + Command-Line + Lang-Arg Mode keymaps to remove
---@field t   table<string, '""'|false> Terminal Mode keymaps to remove
---@field ['"!"'] table<string, '""'|false> Insert + Command-Line Mode keymaps to remove
---@field ['""']  table<string, '""'|false> Normal, Visual and Operating-Pending Mode keymaps to remove

---@class KeymapsTable
---@field plugin boolean Whether this whole table will be loaded on startup or not
---@field n   table<string, KeymapConfig> Normal Mode keymaps
---@field x   table<string, KeymapConfig> Visual Mode keymaps
---@field s   table<string, KeymapConfig> Select Mode keymaps
---@field v   table<string, KeymapConfig> Visual + Select Mode keymaps
---@field o   table<string, KeymapConfig> Operator-Pending Mode keymaps
---@field i   table<string, KeymapConfig> Insert Mode keymaps
---@field c   table<string, KeymapConfig> Command-Line Mode keymaps
---@field l   table<string, KeymapConfig> Insert + Command-Line + Lang-Arg Mode keymaps
---@field t   table<string, KeymapConfig> Terminal Mode keymaps
---@field ['"!"'] table<string, KeymapConfig> Insert + Command-Line Mode keymaps
---@field ['""'] table<string, KeymapConfig> Normal, Visual and Operating-Pending Mode keymaps

---@class KeymapConfig
---@field [1] string|fun() A Vimscript string or a Lua function. `rhs` of the keymap
---@field [2] string Description for the keymap
---@field opts NvKeymapOpts? List of additional options for the keymap
