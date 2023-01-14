parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
H,W,K = parseMap(split(readline()))
A = zeros(H,W)
for i in 1:H
    A[i]  = parseMap(split(readline()))
end
ans = 0
if sum(A) < K
    println(0)
else
    if H > W
        cut_H = []
        tamari = []
        for i in 1:H
            if tamari + sum(A[i]) < K || cut_H == [] 
                ans += 1
                tamari += sum(A[i])
            else
                c_sum = 0
                for j in 1:W
                    c_sum += A[i][j]
                    if c_sum == K
                        ans += 1
                    end
                push!(cut_H,j) 
                    
