const DEBUG = true  

function debug(args...)
    if DEBUG
        println(args...)
    end
end


function main()
    H, W, K = parse.(Int, split(readline()))
    S = [collect(readline()) for _ in 1:H]
    
    function count(i, j, k, l)
        (S[i][j] == '#' || S[k][l] == '#') && (return 0)
        
        
        visited = [false for _ in 1:H, _ in 1:W]  
        directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]  
        
        function dfs(x, y, s)
            if (x, y) == (k, l) && s == K
                return 1  
            elseif s > K
                return 0  
            end
            
            visited[x, y] = true 
            paths = 0
            
            for (dx, dy) in directions
                nx, ny = x + dx, y + dy
                if 1 <= nx <= H && 1 <= ny <= W && !visited[nx, ny] && S[nx][ny] == '.'
                    paths += dfs(nx, ny, s + 1)
                end
            end
            
            visited[x, y] = false  
            return paths
        end
        
        return dfs(i, j, 0)
    end

    ans = 0

    # from, to がぎゃくてs
    cache = Dict{Tuple{Int, Int, Int, Int}, Int}()

    for from_i in 1:H, from_j in 1:W
        for to_i in 1:H, to_j in 1:W
            ans += count(from_i, from_j, to_i, to_j)
        end
    end

    println(ans)
end

main()
