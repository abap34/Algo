s1, e1 = parse.(Int, split(readline()))
s2, e2 = parse.(Int, split(readline()))
s3, e3 = parse.(Int, split(readline()))

println((s1 * e1 + s2 * e2 + s3 * e3) ÷ 10)