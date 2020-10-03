parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

const N = parseInt(readline())

isOK(n) = 7 in digits(n) && 5 in digits(n) && 3 in digits(n)

function dfs(n)
    (n > N) && (return 0)
    if isOK(n) 
        count = 1
    else
        count = 0
    end
    count += dfs(10n + 7)
    count += dfs(10n + 5)
    count += dfs(10n + 3)
    return count
end
    
function main()
    return dfs(0)
end


println(main())