local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

luasnip.filetype_extend("html", {"twig"})
