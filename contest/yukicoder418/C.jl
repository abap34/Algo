function solve(N, M)
    return sum(1:N) % M
end

function main()
    T = parse(Int, readline())
    for _ in 1:T
        N, M = parse.(BigInt, split(readline()))
        println(solve(N, M))
    end
end

main()