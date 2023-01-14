using Glob
run(`pwd`)
files = glob("D/in/*.txt")
for file in files
    test_name = split(file, "/")[end]
    println("input: $test_name")
    run(`julia14 F.jl < $file`)
end
