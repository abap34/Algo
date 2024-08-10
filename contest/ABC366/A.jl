function main()
    N, T, A = parse.(Int, split(readline()))
    rem = N - (T + A)
    
    yesno(b::Bool) = (b ? "Yes" : "No") |> println
    yesno(abs(T - A) > rem)

end

main()