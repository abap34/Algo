parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function isOk(n)
    t_base = digits(n)
    if 7 in t_base
        return false
    else
        e_base = digits(n, base=8)
        if 7 in e_base
            return false
        end
    end
    return true 
end

function main()
    N = parseInt(readline())
    ans = 0
    for i in 1:N
        if isOk(i)
            ans += 1
        end
    end
    println(ans)
end


main()