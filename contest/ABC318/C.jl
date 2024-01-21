function main()
    N, D, P = parse.(Int, split(readline()))
    F = parse.(Int, split(readline()))
    money = sum(F)
    current_money = money
    
    F_sorted = sort(F, rev=true)
    for i in 1:N       
        watch = F_sorted[i]
        current_money -= watch
        if (i - 1) % D == 0
            current_money += P
        end
        if current_money < money
            money = current_money
        end   
    end

    println(money)
end

main()