using OffsetArrays

struct Table
    shape::Tuple
    offsets::Tuple
    init::Any
    data::OffsetArray
    selector::Function
    function Table(shape::Tuple, offsets::Tuple, init, selector::Function)
        data = OffsetArray(fill(init, shape...), offsets...)
        return new(shape, offsets, init, data)
    end
end

function update!(table::Table, indices, value)
    if table[indices...] == table.init
        table[indices...] = value
    else
        table[indices...] = table.selector(table[indices...], value)
    end
end