N = 2*10^5
M = 2*10^5
println("$N $M")
for i in 1:M
    a = rand(1:N)
    b = rand(1:N)
    while (a == b)
        b = rand(1:N)
    end

    x = rand(1:10^9)
    y = rand(1:10^9)
    println("$a $b $x $y")
end


    
    