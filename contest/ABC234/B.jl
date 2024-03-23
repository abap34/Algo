N = parse(Int, readline())

X = []
Y = []

for i in 1:N
    x, y = parse.(Int, split(readline()))
    push!(X, x)
    push!(Y, y)
end

d(x1, y1, x2, y2) = sqrt((x1 - x2)^2 + (y1 - y2)^2)

function main(X, Y)
    ans = 0
    for i in 1:N
        for j in 1:N
            _d = d(X[i], Y[i], X[j], Y[j])
            if _d > ans
                ans = _d
            end
        end
    end
    return ans
end


println(main(X, Y))