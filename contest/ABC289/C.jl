function main()
    N, M = parse.(Int, split(readline()))
    A = []
    for i in 1:M
        c = parse(Int, readline())
        a = parse.(Int, split(readline()))
        push!(A, a)
    end
    result = 0
    for i in 0:(2^M-1)
        pettern = digits(i, base=2, pad=M)
        s = Set{Int}()
        for i in 1:M
            if pettern[i] == 1
                push!(s, A[i]...)
            end
        end
        ok = true
        for i in 1:N
            if !(i in s)
                ok = false
            end
        end
        if ok
            result += 1
        end
    end
    println(result)
end

main()