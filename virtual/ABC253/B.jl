H, W = parse.(Int, split(readline()))

function d(ind1, ind2)
    x1, y1 = ind1
    x2, y2 = ind2
    return abs(x1 - x2) + abs(y1 - y2)
end


function main(H, W)
    ind1_checked = false
    ind1 = ()
    for i in 1:H
        S = readline()
        for j in 1:W
            s = S[j]
            if s == 'o'
                if !(ind1_checked)
                    ind1 = (i, j)
                    ind1_checked = true
                else
                    ind2 = (i, j)
                    println(d(ind1, ind2))
                    return 
                end
            end
        end
    end
end



main(H, W)