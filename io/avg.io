# Add in the average method to List
List myAverage := method((self sum) / (self size))

# Note: after peeking at the implementation - turns out they are the same!

# Comparing custom average method vs. built-in
"Normal Function" println
list(3, 2, 9, 3, 7, 6) average println
list(3, 2, 9, 3, 7, 6) myAverage println

"Empty List" println
list() average println
list() myAverage println

# Same error happens here
"List with non-numbers" println
#list(3, 2, "foo") average println
list(3, 2, "foo") myAverage println
