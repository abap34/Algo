abstract type AbstractNode end

mutable struct Node{T} <: AbstractNode
    key::T
    parent::AbstractNode
    left::AbstractNode
    right::AbstractNode
end

mutable struct RootNode{T} <: AbstractNode
    child::AbstractNode
end

struct EmptyNode <: AbstractNode end

mutable struct BinarySearchTree{T}
    root::RootNode{T}
    function BinarySearchTree(A::AbstractArray{T}) where {T}
        (length(A) == 0) && (return new{Any}(RootNode{Any}(EmptyNode())))
        root_node = RootNode{T}(Node{T}(A[1], EmptyNode(), EmptyNode(), EmptyNode()))
        root_node.child.parent = root_node
        t = new{T}(root_node)
        for a in A[2:end]
            insert!(t, a)
        end
        return t
    end
end

function insert!(x::Node{T}, a::T) where {T}
    (x.key == a) && (return -1)
    if a > x.key
        if x.right isa EmptyNode
            x.right = Node(a, x, EmptyNode(), EmptyNode())
        else
            insert!(x.right, a)
        end
    else
        if x.left isa EmptyNode
            x.left = Node(a, x, EmptyNode(), EmptyNode())
        else
            insert!(x.left, a)
        end
    end
end

function insert!(t::BinarySearchTree{T}, a::T) where {T}
    root = t.root.child
    if root isa EmptyNode
        t.root.child = Node{T}(a, t.root, EmptyNode(), EmptyNode())
        return 0
    end
    (root.key == a) && (return -1) # すでにある要素の再追加は無視する
    insert!(root, a)
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

function find(t::BinarySearchTree{T}, x::T) where {T}
    root = t.root.child
    return find(root, x)
end


function connect(x::Node)
    s = ""
    if !(x.left isa EmptyNode)
        s *= ("$(x.key) -> $(x.left.key) [dir=none] \n" * connect(x.left))
    end
    if !(x.right isa EmptyNode)
        s *= ("$(x.key) -> $(x.right.key) [dir=none] \n" * connect(x.right))
    end
    return s
end


function plot(t::BinarySearchTree, size::String)
    root = t.root.child
    s = connect(root)
    return "digraph g {
            graph [
                size=$size
                labelloc=\"t\";
            ];\n
$s
            }"
end


function show(t::BinarySearchTree, filename::String; size=(10, 5))
    size = "\"$(size[1]),$(size[2])\""
    s = plot(t, size)
    open("$filename.dot", "w") do io
        write(io, s)
    end
    cmd = `dot $filename.dot -T png -o $filename.png`
    run(cmd)
end


tree = BinarySearchTree([5, 2, 7, 8, 4, 6, 10])

show(tree, "bst", size=(10, 5))