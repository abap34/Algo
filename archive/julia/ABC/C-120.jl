parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    S = chomp(readline())
    zs = 0
    os = 0
    for s in S
        if s == '0'
            zs += 1
        else
            os += 1
        end
    end 
    ans = 2 * min(zs, os)
    return ans
end


println(main())