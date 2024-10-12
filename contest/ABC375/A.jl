function main()
    N = parse(Int, readline())
    S = collect(readline())
    
    ans = 0
    for i in 1:N-2
        if S[i] == '#' && S[i+2] == '#' && S[i+1] == '.'
            ans += 1
        end
    end

    println(ans)
end

main()