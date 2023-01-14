#=
B:
- Julia version:  0.5.2
- Author: abap
- Date: 2019-11-24
=#

N = readline()
N = parse(N)
S = readline()
S = strip(S)
str_array = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
index_array = []
for i in S
    v = find(x->x==i,str_array)
    push!(index_array,v[1])
end

for j in index_array
    j += N
    if j <= 26
        print(str_array[j])
    else
        j -= 26
        print(str_array[j])
        end
end
print("\n")