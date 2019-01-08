local fthelper = {
  functions = {},
  types = {}
}

fthelper.functions.format = function(repldef, lines)
  assert(type(lines) == "table", "Supplied lines is not a table")

  local new = {}
  local off = 0

  if repldef.open ~= nil then
    extend(new, repldef.open)
  end

  for ix, v in ipairs(lines) do
    new[ix+off] = v
  end

  if repldef.close ~= nil then
    extend(new, repldef.close)
  elseif (#new > 0
      and new[#new] ~= ""
      and string.byte(string.sub(new[#new], 1, 1)) > 31) then
    table.insert(new, "")
  end

  new[#new+off] = ''
  return new
end

return fthelper
