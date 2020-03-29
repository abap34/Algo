function BinarySearch(A,n,key)
    left = 1
    right = n + 1
    while left < right
        mid = (left + right) ÷ 2
        if A[mid] == key
            return mid
        elseif key < A[mid]
            right = mid
        else
            left = mid + 1
        end
    end
end
