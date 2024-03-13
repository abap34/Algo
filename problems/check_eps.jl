function check_eps(file1, file2)
    ans_float = readlines(file1)
    ans_float = parse(Float64, ans_float[1])
    ans_rational = readlines(file2)
    ans_rational = parse(Float64, ans_rational[1])
    absolute_error = abs(ans_float - ans_rational)
    relative_error = absolute_error / ans_float
    println("absolute_error: ", absolute_error)
    println("relative_error: ", relative_error)
end


file1 = ARGS[1]
file2 = ARGS[2]
check_eps(file1, file2)