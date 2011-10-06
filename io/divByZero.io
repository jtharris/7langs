# Redefine divide by zero to return 0
Number div := Number getSlot("/")
Number / := method(n, if(n == 0, 0, self div(n)))

# These should all return 0
(4 / 0) println
(-9 / 0) println
(0.88 / 0) println
(0 / 0) println

# Normal division should work unmodified
(6 / 2) println
(-9 / 3) println
(5 / 2) println
