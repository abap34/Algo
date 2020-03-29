#=
B:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-01
=#
function main()
N = parse(readline())
x = div(N,1.08)
x = convert(Int,x)
ans = false
for i in x - 500:x + 500
    money = 1.08 * i
    if money == N
        println(i)
        ans = true
        break
                end
end
if ans != true
    println(":(")
end
end
main()

