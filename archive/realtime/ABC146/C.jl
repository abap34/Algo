#=
C:
- Julia version:  0.5.2
- Author: abap
- Date: 2019-11-24
=#
A,B,X  = parse.(split(readline()))

get_keta(N) = length((String,N))

get_money(A, B, N) = A * N + B * get_keta(N)


#=unction main()
left = 1
right = 10^9
mid = div((left+right),2)
println("Next -> search $left to $right")
println("mid -> $mid")
while left < right
    global money = get_money(A,B,mid)
    if  money < X
        left = mid +1
        mid = (left + right) ÷ 2
    elseif money > X
        right = mid
        mid = (left + right) ÷ 2
    else
        return money
    end
    println("Next -> search $left to $right")
end
println(money)
end

main()=#
function main()
    for i in 1:50:N
