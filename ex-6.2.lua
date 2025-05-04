-- Exercise 6.2: Write a function that takes an arbitrary number of
-- values and returns all of them, except the first one.

function all_but_first (...)
  return select(2, ...)
end

--[[
-- Alternate version using table.pack
function all_but_first (...)
  local args = table.pack(...)
  table.remove(args, 1) -- inefficient!
  return table.unpack(args)
end
--]]

print(all_but_first())             -- (nothing printed)
print(all_but_first(1))            -- (nothing printed)
print(all_but_first(1, 2, 3))      --> 2	3
print(all_but_first(1, 2, 3, 4))   --> 2	3	4
