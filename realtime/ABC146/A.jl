#=
A:
- Julia version:  0.5.2
- Author: abap
- Date: 2019-11-24
=#
parse_Int(x) = parse(Int,x)
read_Str() = strip(readline())
read_IntList(x) = parse_Int.(split(readline(x)))
read_strList(x) = split(read_Str())

day = read_Str()
if day == "SUN"
    println(7)
elseif day == "MON"
    println(6)
elseif day == "TUE"
    println(5)
elseif day == "WED"
    println(4)
elseif day == "THU"
    println(3)
elseif day == "FRI"
    println(2)
elseif day == "SAT"
    println(1)
end