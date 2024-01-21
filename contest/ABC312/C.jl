function ok(N)
    N = reverse(digits(N))
    for i in 1:length(N)-1
        if N[i+1] >= N[i]
            return false
        end
    end
    return true
end


function naive(N)
    idx = 1
    for i in 1:10000
        if ok(i)
            if idx == N
                return i
            else
                idx += 1
            end
        end
        
    end
end


function undigits(A)
    _A = reverse(A)
    r = 0
    for i in length(_A):-1:1
        r += 10^(i - 1) * _A[i]
    end
    return r
end


function main(N)
    N += 1
    global table = zeros(Int, (10, 10))
    table[:, 1] .= 1
    for i in 2:10
        for j in 2:10
            table[i, j] = table[i - 1, j] + table[i - 1, j  - 1]
        end
    end

    table_flat = vcat(table...)

    # display(table)
    
    c = cumsum(table_flat) 
    
    for i in eachindex(c)
        if c[i] >= N
            rem = c[i] - N
            if rem == 0
                k = table[i]
            else
                k = N - c[i - 1]
            end
            s = i % 10 - 1
            if s == -1
                s = 9
            end
            d = (i - 1) ÷ 10 + 1  
            if d == 1
                return s
            end
            ans = [s, ]
            return undigits(solve(d - 1, s, k, ans))
        end
    end

end




function solve(d, s, k, ans)
    # if d == 2
    #     for t in memo[k]
    #         push!(ans, t)
    #     end
    #     return ans
    # end

    # if d == 2
    #     push!(ans, k)
    # end


    # println("solve is called!!")
    if d == 1
        # @show d, s, k
        s = k % 10 
        if s == -1
            s = 9
        end
        push!(ans, s)
        return ans
    end

    # println("$d 桁の, $s から始まる数の $k 番目を考える")  
    target_col = table[:, d]
    c = cumsum(target_col)

    for i in eachindex(c)
        if c[i] >= k
            rem = c[i] - k
            if rem == 0
                kk = target_col[i]
            else
                kk = k - c[i - 1]
            end
            s = i % 10 - 1
            if s == -1
                s = 9
            end
            push!(ans, s)  
            return solve(d - 1, s, kk, ans)
        end
    end
end

println("solve | naive")

for i in 1:100
    println("[$i] $(main(i)) | $(naive(i))")
    println("=============")
end


N = parse(Int, readline())

println(main(N))