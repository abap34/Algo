parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    S = collect(chomp(readline()))
    Q = parseInt(readline())
    turn_counter_by_query = fill(0,Q)
    #println(S)
    turn = 0
    pusher = []
    #before_push = AbstractArray{Array{Char,Bool}}()
    for j in 1:Q
        T = split(chomp(readline()))
        if length(T) == 1
            turn += 1
        else
            F,C = T[2],T[3][1]
            prepend!(pusher,[[C,F == "1"]])     
        end
        #println(S)
        turn_counter_by_query[j] = turn % 2 == 1
    end

    turn_array = []
    for k in turn_counter_by_query
        push!(turn_array,(turn - k)%2==1)
    end    
    before_push = []
    after_push = []
    for (pushe,isTurn) in zip(pusher,turn_counter_by_query)
        c,isBefore = pushe[1],pushe[2]
        if isBefore && isTurn
            push!(after_push,c)
        elseif isBefore && !(isTurn)
            prepend!(before_push,[c])
        elseif !(isBefore) && isTurn
            push!(after_push,c)
        elseif !(isBefore) && !(isTurn)
            prepend!(before_push,[c])
        end    
    end
    if turn % 2  == 1
        reverse!(S)
        reverse!(before_push)
        reverse!(after_push)
    end 
    prepend!(S,before_push)
    #println(S)
    append!(S,after_push)

    for i in S
        print(i)
    end
    println("")
end      
main()