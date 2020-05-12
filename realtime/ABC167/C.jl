parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N,M,X = parseMap(split(readline()))

C = []
A = []
for i in 1:N
    this_line = parseMap(split(readline()))
    c = this_line[1]
    a = this_line[2:end]
    push!(C,c)
    push!(A,a)
end

function BitSearch(x)
    count_pettern = x ^ 2
    petterns = []
    for i in 0:count_pettern - 2
        bit = digits(i,base=2,pad=x)
        push!(petterns,bit)
    end
    return  petterns
end


all_pettern = BitSearch(N)
println(all_pettern)
min_money = 10^10
for pettern in all_pettern
    println(pettern)
    money = 0
    ok = zeros(Int,M)
    for i in 1:N
        if pettern[i] == 1
            money += C[i]
            for j in 1:M
                ok[j] += A[i][j]
            end 
        end
    end
    isOk = true
    #println("in this pettern, ok will be:")
    #println(ok)
    for o in ok
        if o < X
            isOk = false    
            break
        end
    end
    if isOk
        #println("it is ok!")
        #println("money is ",money)
        if money < min_money
            #println("new record")
            min_money = money
        end
    end
end
if min_money == 10^10
    println(-1)
else
    println(min_money)
end

end

main()