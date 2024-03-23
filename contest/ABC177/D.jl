parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


#=
function add_list(A::Int, B::Int, friend_list::AbstractArray, start = nothing)
    println("$A は $B と友達")
    (start === nothing) && (start = A)
    @show start
    (B == start) && (return true)
    @show B
    @show friend_list
    (isempty(friend_list[B])) && (return true)
    for _b in friend_list[B]
        (add_list(A, _b, friend_list, start)) && (return true)
    end
    for _a in friend_list[A]
        (add_list(_a, B, friend_list, start)) && (return true)
    end
    
    
end
=#


function search(b, friend_list, start=0)
    @show b
    @show start
    if b == start && start != 0
        return people
    end

    if start == 0
        start = b
        people = Set{Int}()
    end

    for _b in friend_list[b]
        push!(people, search(_b, friend_list, start))
    end
    return people
end

function checklist!(friend_list, N, start=0)
    for person in friend_list
        for p in person
            push!(person, search(p, friend_list, p))
        end
    end
    return friend_list
end

function main()
    N, M = parseMap(split(readline()))
    friends_list = []

    for i in 1:N
        push!(friends_list, Set())
    end


    for i in 1:M
        A, B = parseMap(split(readline()))
        # add_list(A, B, friends_list)
        push!(friends_list[A], B)
        push!(friends_list[B], A)
    end
    @show friends_list
    checklist!(friends_list, N)

    @show friends_list
end

main()  