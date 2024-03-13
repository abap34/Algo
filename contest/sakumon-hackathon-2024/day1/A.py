def outer_prod(v1, v2):
    return v1[0] * v2[1] - v1[1] * v2[0]

def is_intersect(x1, y1, x2, y2, X1, Y1, X2, Y2):
    # (x1, y1) -> (X1, Y1) と (x2, y2) -> (X2, Y2) の線分が交差するかどうか
    v1 = [X1 - x1, Y1 - y1]
    v2 = [X2 - x1, Y2 - y1]
    v3 = [X1 - x2, Y1 - y2]
    v4 = [X2 - x2, Y2 - y2]

    if outer_prod(v1, v2) * outer_prod(v3, v4) <= 0:
        return True
    return False

def main():
    T = int(input())
    for i in range(T):
        x1, y1, x2, y2, X1, Y1, X2, Y2 = map(int, input().split())
        print('(', x1, y1, ') -> (', X1, Y1, ') と (', x2, y2, ') -> (', X2, Y2, ') は、', is_intersect(x1, y1, x2, y2, X1, Y1, X2, Y2))
        if is_intersect(x1, y1, x2, y2, X1, Y1, X2, Y2):
            print('No')
        else:
            print('Yes')

if __name__ == "__main__":
    main()
