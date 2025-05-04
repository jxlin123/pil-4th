-- Exercise 6.1: Write a function that takes an array and prints all
-- its elements.

-- Prints out the elements of the passed-in array. If the table is not
-- an array, then not all elements may be printed out.
function print_array (a)
  print(table.unpack(a))
end

print_array({1, 2, 3})     --> 1	2	3
