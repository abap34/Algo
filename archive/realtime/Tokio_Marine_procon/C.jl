parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function solve(N, K, A)
    for _ in 1:K
        tmp = zeros(Int64, N)
        for i in 1:N
            to = max(1, i - A[i])
            en = min(N, i + A[i])
            tmp[to] += 1
            (en + 1 <= N) && (tmp[en + 1] -= 1)
        end
        for i in 2:N
            tmp[i] += tmp[i - 1] 
        end
        if A == fill(N, N)
            return A
        else
            A = tmp
        end
    end
    return A
end


function print_ans(A)
    for a in A
        print(a, " ")
    end
    println()
end



function main()

    N, K = parseMap(split(readline()))

    A = parseMap(split(readline()))


    print_ans(solve(N, K, A))

end

main()