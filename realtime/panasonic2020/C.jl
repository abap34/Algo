a,b,c = parse.(split(readline()))

uhen  = c - a - b
sahen = 4 * a * b
if uhen < 0 
    println("No")
else
    if sahen < uhen ^ 2
        println("Yes")
    else
        println("No")
    end
end