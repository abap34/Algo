parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
N,K = parseMap(split(readline()))
A = parseMap(split(readline()))

start_city = 1
still_see = Set{Int}()
push!(still_see,1)
if N < K
for i in 1:K
    visit_city = A[start_city]
    if visit_city in still_see
        loop_begin_city = visit_city
        loop_fin_city = start_city
        loop_start_city = loop_fin_city
        loop_arrays = [loop_fin_city,]
        for j in 1:10^6
            loop_visit_city = A[loop_start_city]
            if loop_visit_city == loop_fin_city
                ans_idx = ((K - i) % length(loop_arrays)) - 1
                if ans_idx == 0 
                    return loop_arrays[end]
                elseif ans_idx == -1
                    return loop_arrays[end]
                end
                return loop_arrays[ans_idx]
            else
            end
            push!(loop_arrays,loop_visit_city)
            loop_start_city = loop_visit_city
        end
    else
        push!(still_see,visit_city)
    end
    start_city = visit_city
end
else
    for i in 1:K
        visit_city = A[start_city]
        start_city = visit_city
        if i == K
            return visit_city
        end
    end
end
end


println(main())
