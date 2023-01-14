N, A, B = parse.(Int, spli(readline()))

function main(N, A, B)
    Sₙ = sum(0:N)
    Sₐ = sum(0:A:N)
    Sᵦ = sum(0:B:N)
    Sₐᵦ = sum(0:lcm(A, B):N)
    println(Sₙ - (Sₐ + Sᵦ - Sₐᵦ))
end



main(N, A, B)







































