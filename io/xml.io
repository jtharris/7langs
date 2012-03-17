
Builder := Object clone

Builder indent := 0
Builder writeIndent := method(write(" " repeated (self indent)))
Builder forward := method(

    self writeIndent
    writeln("<", call message name, ">")
    self indent = self indent + 1
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence",
            self writeIndent
            writeln(content)
        ))

    self indent = self indent - 1
    self writeIndent
    writeln("</", call message name, ">"))

Builder ul(
        li("Io"),
        li("Lua"),
        li("JavaScript"))
