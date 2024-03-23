function solve(N, S, C)
    Z = zeros(Int, N)
    O = zeros(Int, N)

    for i in 1:N
        if i % 2 == 1
            if C[i] == '0'
                O[i] = C[i]
            else
                Z[i] = C[i]
            end
        else
            if C[i] == '0'
                Z[i] = C[i]
            else
                O[i] = C[i]
            end
        end
    end

    @show Z
    @show O
    
    Z_c = cumsum(Z)
    O_c = cumsum(O)

    @show Z_c
    @show O_c

    ans = O_c[end] - O_c[2]

    ans = min(
        ans,
        O[1] + O_c[end] - O_c[3]    
    )

    for i in 3:N-1
        if i % 2 == 1
            bef = Z_c[i] 
            aft = O_c[end] - O_c[i+1]
            ans = min(
                ans,
                bef + aft
            )
        else
            bef = O_c[i]
            aft = O_c[end] - O_c[i+1]
            ans = min(
                ans,
                bef + aft
            )
        end 
    end


    ans = min(
        ans,
        Z_c[end] - Z_c[2]
    )

    ans = min(
        ans,
        Z[1] + Z_c[end] - Z_c[3]
    )

    for i in 3:N-1
        if i % 2 == 0
            bef = Z_c[i] 
            aft = Z_c[end] - Z_c[i+1]
            ans = min(
                ans,
                bef + aft
            )
        else
            bef = O_c[i]
            aft = Z_c[end] - Z_c[i+1]
            ans = min(
                ans,
                bef + aft
            )
        end 
    end

    return ans
    

end

function flip(S)
    result = Char[]
    for s in S
        if s == '0'
            push!(result, '1')
        else
            push!(result, '0')
        end
    end

    return result
end


function main()
    N = parse(Int, readline())
    S = collect(readline())
    C = parse.(Int, split(readline()))

    ans1 = solve(N, S, C)

    @show ans1

    # ans2 = solve(N, flip(S), C)

    @show ans2

    println(min(ans1, ans2))


end

main()