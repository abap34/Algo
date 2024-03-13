#include <bits/stdc++.h>

void output(std::vector<std::vector<int>> A)
{
    for (auto vec_a : A)
    {
        for (auto a : vec_a)
        {
            std::cout << a << " ";
        }
        std::cout << "\n";
    }
}

int main()
{
    std::vector<std::vector<int>> A = {{1, 5, 2},
                                       {6, 1, 4},
                                       {5, 2, 3},
                                       {2, 3, 1}};
    //std::sort(A.begin(), A.end());
    for (int i = 0; i < 4; i++){
        sort(A[i].begin(), A[i].end());
    }
    output(A);


    
}