using Random
import Base

abstract type AbstractNode end

struct EmptyNode <: AbstractNode end

mutable struct Node{T} <: AbstractNode
    key::T
    p::Float64
    parent::AbstractNode
    left::AbstractNode
    right::AbstractNode
    place::String
    function Node(key::T, parent::AbstractNode, left::AbstractNode, right::AbstractNode, place::String) where {T}
        @assert place in ("left", "right", "root")
        return new{T}(key, rand(), parent, left, right, place)
    end
end

mutable struct RootNode <: AbstractNode
    child::AbstractNode
    p::Int
end

function RootNode(child::Node{T}) where {T}
    RootNode(child, 2)
end

function RootNode(child::EmptyNode)
    RootNode{Any}(child, 2)
end


mutable struct Treap{T}
    root::RootNode
    function Treap(A::AbstractArray{T}) where {T}
        (length(A) == 0) && (return new{T}(RootNode(EmptyNode())))
        root_node = RootNode(Node(A[1], EmptyNode(), EmptyNode(), EmptyNode(), "root"))
        root_node.child.parent = root_node
        t = new{T}(root_node)
        for a in A[2:end]
            insert!(t, a)
        end
        return t
    end
end



function insert!(x::Node{T}, a::T) where {T}
    (x.key == a) && (return nothing)
    if a > x.key
        if x.right isa EmptyNode
            x.right = Node(a, x, EmptyNode(), EmptyNode(), "right")
            swap!(x.right)
        else
            insert!(x.right, a)
        end
    else
        if x.left isa EmptyNode
            x.left = Node(a, x, EmptyNode(), EmptyNode(), "left")
            swap!(x.left)
        else
            insert!(x.left, a)
        end
    end
    return nothing
end

function insert!(t::Treap{T}, a::T) where {T}
    root = t.root.child
    if root isa EmptyNode
        t.root.child = Node{T}(a, t.root, EmptyNode(), EmptyNode(), "root")
        return nothing
    end
    (root.key == a) && (return nothing)
    return insert!(root, a)
end


function connect(x::Node)
    s = ""
    if !(x.left isa EmptyNode)
        s *= "$(x.left.key) [label=\"$(x.left.key), \\n $(x.left.p)\"] \n"
        s *= ("$(x.key) -> $(x.left.key)  \n" * connect(x.left))
    end
    if !(x.right isa EmptyNode)
        s *= "$(x.right.key) [label=\"$(x.right.key), \\n $(x.right.p)\"] \n"
        s *= ("$(x.key) -> $(x.right.key) \n" * connect(x.right))
    end
    return s
end


function plot(t::Treap, size)
    root = t.root.child
    s = "$(root.key) [label=\"$(root.key), \\n $(root.p)\"]\n" * connect(root)
    return "digraph g {
            graph [
                size=$size
                labelloc=\"t\";
            ];\n
$s
            }"
end


function find(x::Node{T}, a::T) where {T}
    if x.key == a
        return true
    else
        if a > x.key
            if x.right isa EmptyNode
                return false
            end
            return find(x.right, a)
        else
            if x.left isa EmptyNode
                return false
            end
            return find(x.left, a)
        end
    end
end

function find(t::Treap{T}, x::T) where {T}
    root = t.root.child
    return find(root, x)
end

function show(t::Treap, filename::String; size=(10, 5))
    size = "\"$(size[1]),$(size[2])\""
    s = plot(t, size)
    open("$filename.dot", "w") do io
        write(io, s)
    end
    cmd = `dot $filename.dot -T pdf -o $filename.pdf`

    run(cmd)
end




function swap!(x::RootNode) end


function swap!(x::Node{T}) where {T}
    if x.p > x.parent.p
        k = x.parent.parent
        y = x.parent
        if x.place == "left"
            c = x.right
        else
            c = x.left
        end
        x_place = x.place
        y_place = y.place
        x.parent = k
        if x.place == "left"
            x.right = y
        else
            x.left = y
        end
        x.place = y.place
        y.parent = x
        if x_place == "right"
            y.right = c
        else
            y.left = c
        end
        y.place = x.place == "right" ? "right" : "left"
        if !(c isa EmptyNode)
            c.parent = y
            c.place = x_place
        end
        if y_place == "right"
            k.right = x
        elseif y_place == "left"
            k.left = x
        else
            k.child = x
        end
    end
    swap!(x.parent)
end
