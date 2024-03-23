function main(K)
    A = reverse(digits(K, base=2))
    for a in A
        print(a * 2)
    end
    println()
end


K = parse(BigInt, readline())
main(K)