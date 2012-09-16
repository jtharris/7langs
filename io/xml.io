Builder := Object clone

# The current indentation level
Builder indent := 0
Builder writeIndent := method(write(" " repeated (self indent)))

# Translate the curly bracket syntax of {"foo": "bar"} into foo="bar"
Builder curlyBrackets := method(
    call message arguments map(arg,
        parts := arg asString split(":") map(s, s strip)
        parts first clone strip("\"") appendSeq("=", parts last)
    ) join(" ")
)

# This does the heavy lifting - called when the message is not found
Builder forward := method(
    self writeIndent

    args := call message arguments clone

    # Opening tag
    write("<", call message name)

    # Add in any attributes if that is the first argument
    if (args first name == "curlyBrackets",
        write(" ", self doMessage(args removeFirst)))
    writeln(">")
    self indent = self indent + 1

    # Recursive call to handle nested elements
    args foreach(
        arg,
        content := self doMessage(arg)
        if(content type == "Sequence",
            self writeIndent
            writeln(content)
        ))

    self indent = self indent - 1
    self writeIndent

    # Closing tag
    writeln("</", call message name, ">"))

# Example DSL
Builder ul(
        li({"prototyped" : "True", "fun": "False"}, "Io"),
        li("Lua"),
        li("JavaScript"))
