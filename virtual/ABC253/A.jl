A = parse.(Int, split(readline()))

if sort(A)[2] == A[2]
    println("Yes")
else
    println("No")
end

