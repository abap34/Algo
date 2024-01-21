N, M, P = parse.(Int, split(readline()))

if N < M
    println(0)
else
    R = N - M
    println(1 + R ÷ P)
end

