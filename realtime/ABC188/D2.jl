parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, C = parseMap(split(readline()))
    A = []
    B = []
    for i in 1:N
        a, b, c = parseMap(split(readline()))
        push!(A, a)
        push!(B, b)
    end 

    arr = vcat(A, B)

    sort!(arr)


    arr_dict = Dict{Int, Int}()

    for i in 2:length(arr)
        arr_dict[11i] = arr[i]
    end

    @show arr_dict


end

main()