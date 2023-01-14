A,B = parse.(split(readline()))
if A % 2 != B % 2
    println("IMPOSSIBLE")
else
    println((A + B) / 2)
end