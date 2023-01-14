parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
A1 = parseMap(split(readline()))
A2 = parseMap(split(readline()))
A3 = parseMap(split(readline()))
A = []
append!(A,A1)
append!(A,A2)
append!(A,A3)
N = parseInt(readline())
for i in 1:N
    b = parseInt(readline())
    for i in 1:9
        a = A[i]
        if a == b
            A[i] = 999
        end
    end
end

if A[1] == A[4] == A[7] || A[2] == A[5] == A[8] || A[3] == A[6] == A[9] || A[1] == A[2] == A[3] || A[4] == A[5] == A[6] || A[7] == A[8] == A[9] || A[1] == A[5] == A[9] || A[3] == A[5] == A[7]
    println("Yes")
else 
    println("No")
end    
    