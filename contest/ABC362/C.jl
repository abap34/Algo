function build(L, R)
    N = length(L)
    X = copy(L)
    C = sum(X)
    
    for i in 1:N
        if C == 0
            break
        end
        diff = R[i] - L[i]
        if C > 0
            if C <= diff
                X[i] -= C
                C = 0
            else
                X[i] = R[i]
                C -= diff
            end
        elseif C < 0
            if -C <= diff
                X[i] += -C
                C = 0
            else
                X[i] = R[i]
                C += diff
            end
        end
    end

    for i in 1:N
        @assert L[i] <= X[i] <= R[i]
    end
    
    @assert sum(X) == 0 
    
    return X
end

function main()
    N = parse(Int, readline())
    L = Int[]
    R = Int[]
    for _ in 1:N
        l, r = parse.(Int, split(readline()))
        push!(L, l)
        push!(R, r)
    end
    
    yesno(b::Bool) = (b ? "Yes" : "No") |> println

    if sum(R) < 0 || sum(L) > 0
        yesno(false)
        return
    end

    yesno(true)
    println(join(build(L, R), " "))
end

main()
