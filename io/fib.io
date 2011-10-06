# Recursive
"Recursive" println
"==================" println
fibRecurse := method(n, 
  if(n <= 2, 1, fibRecurse(n - 1) + fibRecurse(n - 2))
)
for(i, 1, 10, fibRecurse(i) println)

"\nLoop" println
"==================" println
fibLoop := method(n,
  if(n <= 2, 1,
    # Holds the last two number of the sequence
    last := list(1, 1)

    # Loop through n - 2 times, pushing the sum and
    # removing the head.  Always keeping the last 2
    (n - 2) repeat(last push(last sum) removeAt(0))

    # Return the value at the end
    last pop
  )
)
for(i, 1, 10, fibLoop(i) println) 
