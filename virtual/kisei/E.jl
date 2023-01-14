function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    invs = [1]
    for i in 1:N-1
        if A[i+1] <= A[i]
            push!(invs, i+1)
        end 
    end
    ans = N
    push!(invs, N+1)
    for i in 1:length(invs) - 1
        d = invs[i + 1] - invs[i]
        if d <= 1
            continue
        end
        # println("between $(invs[i]) and $(invs[i+1]), $(sum(1:d-1))")
        ans += sum(1:d-1)
    end     
    println(ans)
end

main()