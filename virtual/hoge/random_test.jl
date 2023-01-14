using Random

function generate(N)
    B = shuffle(1:N)
    case = "$N \n"
    for b in B
        case *= "$b "
    end
    case *= "\n"
    return case
end

function write_case(filename, n)
    println("write to $filename")
    open(filename, "w") do fp
        write(fp, generate(n))
    end
end

filename = ARGS[1]
n = rand(1:10)
case = generate(n)
write_case(filename, n)
