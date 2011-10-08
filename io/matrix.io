
Matrix := List clone

Matrix dim := method(x, y, empty; x repeat(append(List clone setSize(y))))
Matrix set := method(x, y, value, at(x) atPut(y, value))
Matrix get := method(x, y, at(x) at(y))

# Bonus!
Matrix transpose := method(
    t := self clone
    t dim(at(0) size, size)  # Busted for size 0!
    foreach(x, xVal, xVal foreach(y, yVal, t set(y, x, yVal)))

    t
)

# Useful for debugging...
Matrix render := method(
    # This would probably look better if each column
    # were sized independently, but meh 
    colWidth := (flatten map(x, x asString size) max) + 2

    foreach(x,
        "|" print
        x foreach(y, y asString alignCenter(colWidth, " ") print)
        "|" println
    )
)

Matrix writeTo := method(fileName, 
    File clone open(fileName) write(serialized) close
)

Matrix readFrom := method(fileName, doFile(fileName) setProto(Matrix))

#==============================================================================
# Try some stuff out!
m := Matrix clone
m dim(3, 4)
 
m set(1, 3, 88)
m set(2, 2, "Hello")
m set(0, 0, "Foo")
m set(2, 0, 9787)
"Original Matrix ------------------------" println
m render

# Write it out transposed
m transpose writeTo("./matrix.txt")

"New Transposed Matrix ------------------" println
Matrix readFrom("./matrix.txt") render
