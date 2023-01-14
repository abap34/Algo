parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
function ovf_fact(n)
    const MOD = 10^9 + 7
    ans = 1
    for i in n:-1:1
        ans *= i % MOD
    end     
    return  ans
    
end    
    

function bi(n,k)
    t = n - k 
    m = n
    k_flag = false
    t_flag = false
    if k > t
        for i in n-1:-1:1
            if i != k
                m *= i
            else
                k_flag = true
                break
            end 
        end    
    else
        for i in n-1:-1:1
            if i != t
                m *= i
            else
                t_flag = true
                break
            end 
        end
    end        
    if k_flag 
        result = Int(m / ovf_fact(t))
        #println("(n-k)を消しました")
        #println("$n C $k is $result")
        return result
    elseif t_flag
        #println("kを消しました")
        result = Int(m / ovf_fact(k))
        #println("$n C $k is $result")
        return result
    else
        return Int(m/ovf_fact(k)*ovf_fact(n-k))    
    end    
end
 

#=function bi(n,k)
    m = ovf_fact(n)
    c = ovf_fact(k)
    return Int(m/c)
end=#    

#=function main()
N,a,b = parseMap(split(readline()))
ans = 0
for i in 1:N
    #print(i)
    if i != a && i != b
        ans += bi(N,i)
        println(ans)
    end
end      
println(ans)
end

main()=#

function main()
    N,a,b = parseMap(split(readline()))
    r = 0
    ans = 1
    for  i in 1:N
        ans *= 2
        if r > 30
            ans %= (10^9 +7)
            r = 0
        end
        r += 1
    end
    ans = ans - (bi(N,a) + bi(N,b) + 1) 
    println(ans)        
end
main()