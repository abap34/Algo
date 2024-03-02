function main()
    A, B = parse.(Int, split(readline()))
    for i in 9:-1:0
        if i != (A + B)
            println(i)
            return
        end
    end
end

main()