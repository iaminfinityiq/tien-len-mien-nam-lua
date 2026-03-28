function input(prompt)
    io.write(prompt)
    return io.read("*l")
end

function cls()
    if package.config:sub(1, 1) == "\\" then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

function petc()
    input("Press enter to continue...")
end