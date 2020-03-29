#=
D:
- Julia version: 
- Author: abap
- Date: 2019-11-16
=#
x,y = parse.(split(readline()))
tate,yoko = 0,0
X,Y = 0,0
for i in 1:x
    X += 1
    Y += 2
    println(x-X,y-Y)
    if (x - X)/(y - Y) == 2
        yoko = x
        tate = x - X
        break
    end
end
count = factorial(tate + yoko)/(factorial(tate)+factorial(yoko))
#println(count % (10^9 +7))