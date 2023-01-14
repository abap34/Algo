parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function score(x, A)
    l = 1
    r = 1
    ans = 0
    while r <= length(A)
        if A[r] >= x
            r += 1
            ans = max(ans, r - l)
        elseif r == l
            r += 1
            l += 1
        else
            l += 1
        end
    end
    return ans * x
end

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    println(maximum((x -> score(x, A)).(A)))
end


main()


