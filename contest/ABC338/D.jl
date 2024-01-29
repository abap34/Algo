using DataStructures

yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N, M = parse.(Int, split(readline()))
    X = parse.(Int, split(readline()))

    arr = zeros(Int, N)

    for i in 1:length(X) - 1
        from = min(X[i+1], X[i])
        to = max(X[i+1], X[i])

        cand1 = (to - from)
        cand2 = (from + (N - to))

        arr[from] += cand2
        arr[to] -= cand2

        arr[1] += cand1
        arr[from] -= cand1
        arr[to] += cand1
    end

    ans = minimum(cumsum(arr))
    println(ans)
            
end

main()