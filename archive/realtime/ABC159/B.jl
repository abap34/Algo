parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

S = collect(chomp(readline()))
N = length(S)
if N == 3
    println("Yes")
else
    if S[1:(N-1)÷2] == reverse(S[1:(N-1)÷2]) && S[(N+3)÷2:end] == reverse(S[(N+3)÷2:end]) && S == reverse(S)
        println("Yes")
    else
        println("No")
    end
end