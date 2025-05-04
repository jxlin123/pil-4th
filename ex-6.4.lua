-- Exercise 6.4: Write a function to shuffle a given list. Make sure
-- that all permutations are equally probable.

-- Comment out line below to have deterministic results
math.randomseed(os.time())

-- Shuffle the given list. Assumes the input table is indeed a list
-- (and not, say, a table with holes or any non-positive integer
-- indices). This modifies the original list.
function shuffle_list (lst)
  -- Base case: empty list
  if #lst == 0 then
    return
  end

  -- Take out random element
  local random_index = math.random(#lst)
  local elem = lst[random_index]

  -- Permute rest of list
  table.remove(lst, random_index) -- Ok, this isn't super efficient
  shuffle_list(lst)

  -- Construct final permutation
  table.insert(lst, elem)
  return
end

my_list = {1, 2, 3, 4, 5, 6}
shuffle_list(my_list)
print(table.unpack(my_list))
