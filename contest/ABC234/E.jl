X = parse(Int, readline())
dig(n) = length(digits(n))
f_n(n) = reverse(digits(n))[1]

function print_n(num, N)
    print.(fill(num, N))
    println()
end


function dig_to_num(R)
    n = 0
    for i in 1:length(R)
        @assert R[i] < 10
        n += 10^(length(R) - i) * R[i]
    end
    return n
end



function is_dnum(N)
    N = digits(N)
    if length(N) == 1 || length(N) == 2
        return true
    end
    d = N[1] - N[2]
    for i in 1:length(N)-1
        if N[i] - N[i+1] != d
            return false
        end
    end
    return true
end

function print_safe_ans(N)
    digs = reverse(digits(X))
    n = digs[1]
    for dig in digs
        if dig < n
            print_n(n, length(digs))
            return 
        elseif dig > n
            print_n(n + 1, length(digs))
            return 
        end
    end
    print_n(n, dig(X))
    return 
end

function main(X)
    if is_dnum(X)
        println(X)
        return
    end

    if dig(X) > 10
        print_safe_ans(X)
        return
    elseif dig(X) == 10
        if X > 9876543210
            print_n(9, 10)
        elseif 9876543210 > X > 8888888888
            println(9876543210)
        else
            print_safe_ans(X)
        end
        return
    elseif dig(X) > 6
        N = []
        for i in 0:9
            if dig(X) + i - 1 < 10
                if X <= dig_to_num(i:i+dig(X)-1)
                    push!(N, dig_to_num(i:i+dig(X)-1))
                end
                if X <= dig_to_num(dig(X)+i-1:-1:i)
                    push!(N, dig_to_num(dig(X)+i-1:-1:i))
                end
            end
            if X <= dig_to_num(fill(i, dig(X)))
               push!(N, dig_to_num(fill(i, dig(X))))
            end
        end
        sort!(N)
        println(N[1])
        return
    else
        ans = 100000000
        for i in 1:1000000
            if is_dnum(i)
                if X <= i < ans
                    ans = i
                end
            end
        end
        println(ans)
        return
    end
end


main(X)
