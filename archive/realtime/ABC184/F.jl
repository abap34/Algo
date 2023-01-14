parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)




function main()
    N, T  = parseMap(split(readline()))
    A = parseMap(split(readline()))
    B = A[begin:N÷2]
    C = A[N÷2+1:end]
    ans = 0
    sum_Bs = Set{Int}()

    for i in 1:2^length(B)
        pettern = digits(i - 1, base=2, pad=length(B)) .== 1
        push!(sum_Bs, sum(B[pettern]))
    end

    sum_B = sort(collect(sum_Bs))

    for i in 1:2^length(C)
        pettern = digits(i - 1, base=2, pad=length(C)) .== 1
        sum_C = sum(C[pettern])
        b_idx = searchsortedlast(sum_B, T - sum_C)
        if b_idx > length(sum_B)
            b = sum_B[end]
        elseif b_idx == 0
            b = sum_B[begin]
        else
            b = sum_B[b_idx]
        end

        if ans < b + sum_C <= T
            ans = b + sum_C
        end
    end
    return ans
end
    


println(main())