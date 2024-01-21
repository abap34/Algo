abstract type AbstractNode end

abstract type NormalNode <: AbstractNode end
abstract type SpecialNode <: AbstractNode end

struct Root <: SpecialNode end
struct Leaf <: SpecialNode end

struct Node{T} <: NormalNode
    value::T
    parent::Union{Node{T},Root}
    childs::Union{Vector{Node{T}},Leaf}
end

struct Tree{T}
    root::Root
end

function plot(tree::Tree)
    edges = ""

    

end


# 1 - 2 - 3 - 4 
#     |   |
#     5   6 - 2

tree = Tree{Int}(Root())

node_1 = Node(1, tree.root, [Node(2, node_1, [Node(3, node_2, [Node(4, node_3, Leaf())])]), Node(5, node_1, Leaf())])



