using DataStructures

function calc_left(S, T)
    T_idx = 1
    result = 0
    for i in eachindex(S) 
        if T_idx == length(T) + 1
            return result
        end
        if S[i] == T[T_idx]
            T_idx += 1
            result += 1
        end
    end
    return result
end


function calc_right(S, T)
    return calc_left(reverse(S), reverse(T))
end

# sort 済みの arr を渡すと x 以上の要素の数をカウントして返す 
# O(log(N))
function over_count(arr, x)
    return length(arr) - searchsortedfirst(arr, x) + 1
end


function main()
    N, T = split(readline())
    N = parse(Int, N)

    want = length(T)
   
    left = Int[]
    right = Int[]

    for _ in 1:N
        S = readline()
        push!(left, calc_left(S, T))
        push!(right, calc_right(S, T))
    end

    sort!(right)

    ans = 0

    for i in 1:N
        has = left[i]
        need = want - has
        ans += over_count(right, need)
    end

    println(ans)

end

main()
