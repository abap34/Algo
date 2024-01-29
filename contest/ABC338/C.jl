yesno(b::Bool) = (b ? "Yes" : "No") |> println

function safe_div(x::Int, y::Int)
    if y == 0
        return 10000000000
    else
        return x ÷ y
    end
end

function main()
    N = parse(Int, readline())
    Q = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))
    ans = -1
    for k1 in 0:10^7 + 10
        rem = Q .- k1 .* A
        if sum(x -> x < 0, rem) == 0
            k2 = minimum(safe_div.(rem, B))
            if (k1 + k2) > ans
                ans = k1 + k2
            end
        end        
    end
    println(ans)
end

main()