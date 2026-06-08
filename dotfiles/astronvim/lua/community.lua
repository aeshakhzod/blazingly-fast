-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- https://git.astronvim.com/AstroCommunity

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.python" },
  -- shell
  { import = "astrocommunity.pack.nix" },
  -- { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.bash" },
  -- conf
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.utility.lua-json5" },
  -- js
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.biome" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.svelte" },
}
