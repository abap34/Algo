parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseInt(readline())


function return_all_pettern(x)  #bit全探索
    count_pettern = x ^ 2
    b = []
    for i in count_pettern - 1:-1:1
        bit = bin(i, x)
        bits = []
        for j in 1:x
            push!(bits, bit[j])
        end
        bits = [bits .== '1']
        push!(b, bits)
    end
    #println(length(b))
    return  b
end


function arrayprinter(A)
    for a in A
        print(a)
    end
    println("")
end


function solver(N)
    s = 'a':'x'
    #println(s)
    pettrens = return_all_pettern(N)
    flag = true
    for pettern in pettrens
        #println(sum(pettern))
        h = 1
        ans = []
        if sum(pettern[1]) == 0 || sum(pettern[1]) == 1  
            if flag == true
                #arrayprinter(s[1:N])
                flag = false
            end
        else
            a_flag = pettern[1][1]  
            push!(ans,'a')
            for j in 2:N
                if a_flag 
                    if pettern[1][j]
                        push!(ans,'a')
                    else
                        h += 1
                        push!(ans,s[h])
                    end
                else
                    if pettern[1][j]
                        h += 1
                        push!(ans,'b')
                    else
                        h += 1
                        push!(ans,s[h])
                    end
                end
            end
            arrayprinter(ans)
        end
        #println(flag)
    end
    arrayprinter(s[1:N])
end


if N == 1
    println("a")
elseif N == 2
    println("aa")
    println("ab")
else
    solver(N)
end