function count_combinations(N, K)
    #=
    1 <= a, b <= N かつ a + b = K
    を満たす(a, b)の個数 
    =#
    return min(K - 1, 2N + 1 - K)
end


