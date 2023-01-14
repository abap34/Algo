parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
function get_k(num)
    return (num+1)/2
end
function main()
N, K = parseMap(split(readline()))
P = parseMap(split(readline()))
P = get_k.(P)

res = 0
max_ans_index = 1
for i in 1:N-K
    new = P[i+K]
    less = P[i]
    res += new - less
    if res > 0  #増加　
        max_ans_index = i + 1
        res = 0
    end
end    
println(sum(P[max_ans_index:max_ans_index+K-1]))
end





main()
