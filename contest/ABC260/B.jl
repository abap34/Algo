N, X, Y, Z = parse.(Int, split(readline()))
A = parse.(Int, split(readline()))
B = parse.(Int, split(readline()))
S = A .+ B

passed = []


passed_math = sortperm(A, rev=true)[1:X]
append!(passed, passed_math)

# deleate passed people
not_passed = []
for i in 1:N
    if !(i in passed_math)
        push!(not_passed, i)
    end
end


B_not_passed = getindex.(Ref(B), not_passed)

passed_eng = getindex.(Ref(not_passed), sortperm(B_not_passed, rev=true)[1:Y])
append!(passed, passed_eng)



# deleate passed people
not_passed = []
for i in 1:N
    if !((i in passed_math) || (i in passed_eng))
        push!(not_passed, i)
    end
end


S_not_passed = getindex.(Ref(S), not_passed)

passed_s = getindex.(Ref(not_passed), sortperm(S_not_passed, rev=true)[1:Z])
append!(passed, passed_s)

sort!(passed)

for p in passed
    println(p)
end


