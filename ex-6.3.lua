-- Exercise 6.3: Write a function that takes an arbitrary number of
-- values and returns all of them, except the last one.

function all_but_last (...)
  local args = table.pack(...)
  table.remove(args)
  return table.unpack(args)
end

print(all_but_last())              -- (nothing printed)
print(all_but_last(1))             -- (nothing printed)
print(all_but_last(1, 2, 3))       --> 1	2
print(all_but_last(1, 2, 3, 4))    --> 1	2	3
