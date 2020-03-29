function bit_search(x)  #bit全探索
    count_pettern = x ^ 2
    b = []
    for i in 0:count_pettern - 1
        bit = bin(i, x)
        bits = []
        for j in 1:x
            push!(bits, bit[j])
        end
        bits = [bits .== '1']
        push!(b, bits)
    end
    return  b
end