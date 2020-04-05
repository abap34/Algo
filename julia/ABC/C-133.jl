parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
L,R = parseMap(split(readline()))
if R-L >= 2019
    println(0)
else
    best_ans = 2019^2 + 1
    for i in L:R 
        for j in i+1:R
            ans =  i*j % 2019
            ans < best_ans && (best_ans = ans)
            best_ans == 0 && break
        end
    end
    println(best_ans)
end         
                