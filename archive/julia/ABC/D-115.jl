
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


#=function get_rank(N,X,D)
depth = 0
for j in 1:N
    depth += D[j]
    if depth > X
        return j,depth - X
    end
end 
end

function get_petty(rank,amari)
    ans = 0
    ans += 2^rank

end

function main()
    N,X = parseMap(split(readline()))
    D = []
    for i in N
        push!(D,2^(i+2)-3)
    end
    if X < D[N]/2
        rank,amari = get_rank(N,X,D)
        ans = get_petty(rank,amari)
    end
end    =#





N,X = parseMap(split(readline()))
D = []
P = []
for i in 0:N
    push!(D,2^(i+2)-3)
    push!(P,2^(i+1)-1)
end
#println(D,P)
function get_patty(N,X)
    if N == 1
    	#println("N==1")
        return 3   
    elseif X <= D[N-1] + 1
    	#println("under half")
        return get_patty(N - 1, X - 1)
    else 
    	#println("over half")
        amari = X - (1 + D[N - 1]) - 1 
        return get_patty(N - 1,amari) + P[N-1] + 1
    end
end

ans = get_patty(N,X)
println(ans)