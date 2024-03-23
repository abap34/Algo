N = readline()  
S = collect(readline())

t_ind = findfirst(==('*'), S)

if ('|' in S[begin:t_ind]) && ('|' in S[t_ind + 1:end])
    println("in")
else
    println("out")
end

