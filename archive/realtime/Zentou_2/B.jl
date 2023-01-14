#=
B:
- Julia version: 
- Author: abap
- Date: 2019-11-09
=#
N = parse(readline())
D = parse.(split(readline()))


Ki = []
struct Node
 index::UInt16
 parent::UInt16
end

struct Leaf <: Node
    index::Int16
end

struct root
 child::Array{Node}
end


sort!(D)
for i in D
    if  i == 0
        end
end