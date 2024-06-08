function main()
    S = collect(readline())
    upper_count = count(isuppercase, S)
    lower_count = count(islowercase, S)
    if upper_count > lower_count
        println(join(uppercase.(S)))
    else
        println(join(lowercase.(S)))
    end
end

main()