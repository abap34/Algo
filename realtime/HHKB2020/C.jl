parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    P = parseMap(split(readline()))
    ans = 0
    seen = Set{Int}()
    for p in P
        push!(seen, p)
        if ans == p
            for i in ans:200000
                if !(i in seen)
                    ans = i
                    # println(ans)
                    break
                end
            end
        end
        println(ans)
    end
end


main()