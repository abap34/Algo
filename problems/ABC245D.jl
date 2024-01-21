function main()
    N, M = parse.(Int, split(readline()))
    N += 1
    M += 1
    A = parse.(Int, split(readline()))
    C = parse.(Int, split(readline()))

    trim_len = -1
    for i in 1:100000
        if !((A[i] == 0) && (C[i] == 0))
            A = A[i:end]
            C = C[i:end]
            trim_len = i
            break
        end
    end


    
    N -= (trim_len - 1)

    B = zeros(Int, M)

    B[begin] = C[begin] ÷ A[begin]


    for i in 2:M
        m = C[i]
        for j in 1:i
            if (1 <= (i - j + 1) <= N) && (1 <= j <= M)
                m -= A[i - j + 1] * B[j] 
            end
        end
        B[i] = m ÷ A[begin]
    end
    return B
end

result = main()

for coef in result
    print("$coef ")
end

println()