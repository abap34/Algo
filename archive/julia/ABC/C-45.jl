parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    S = collect(readline())
    N = length(S) - 1
    result = 0
    for i in 0:2^N - 1
        LS = deepcopy(S)
        pettern = digits(i, base=2, pad=N)
        # @show pettern
        count = 0
        for j in 1:N
            if pettern[j] == 1
                insert!(LS, j + 1 + count, '+')
                count += 1
            end
        end
        # @show join(LS)
        result += eval(Meta.parse(join(LS)))
    end
    return result
end


println(main())