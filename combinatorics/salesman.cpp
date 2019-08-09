// Задача коммивояжера. Коммивояжер хочет объехать n городов и вернуться в исходный город.
// Каждые два города соединены между собой дорогами, для которых известны длины. Найдите путь коммивояжера минимальной длины.

// Входные данные
// В первой строке задано натуральное число n - количество городов.
// Следующие n строк содержат длины дорог a[i][j], по n чисел в каждой строке.
// Города пронумерованы числами от 0 до n−1. Гарантируется, что числа a[i][j] - натуральные, a[i][j]=a[j][i]
// и a[i][i]=0 для i и j от 0 до n−1.

// Выходные данные
// В первой строке выведите одно целое число - минимальную длину пути коммивояжера. Во второй строке выведите последовательность из n чисел - сам путь.
// Путь должен содержать номера городов в порядке обхода и начинаться с номера 0. Гарантируется, что путь минимальной длины единственный с точностью до разворота.
// Из двух вариантов выберите тот, в котором меньше номер второго города.

// Пример входных данных
// 4
// 0 1 4 6
// 1 0 5 2
// 4 5 0 3
// 6 2 3 0
// Пример выходных данных
// 10: 0 1 3 2

#include <fstream>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector< vector<int> > a;
vector<int> bestPath;
vector<int> curPath;
vector<bool> used;

int n;
int MIN = 65000;

void out()
{
        cout << MIN << ": ";
        for(int i = 0; i < n; i++)
        {
            if (i)
                cout << " ";
            cout << bestPath[i];
        }
        cout << endl;
}

int count() {
    int w = 0;
    for (int i = 1; i < n; i++) {
        w += a[curPath[i - 1]][curPath[i]];
    }
    w += a[curPath[n - 1]][0];
    return w;
}

void rec(int idx, int bal)
{
    if (idx == n) {
        int w = count();
        if (w < MIN) {
            MIN = w;
            bestPath = curPath;
        }
        return;
    }

    for(int i = 1; i < n; i++) {
        if (used[i])
            continue;
        curPath[idx] = i;
        used[i] = true;
        rec(idx + 1, 0);
        used[i] = false;
    }
}
    
ifstream input("combinatorics/salesman.in");

int main()
{
    input >> n;

    a = vector< vector<int> >(n, vector<int>(n));

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            input >> a[i][j];
        }
    }
                
    used = vector<bool>(n, false);
        
    curPath = vector<int>(n);
    bestPath = vector<int>(n);

    curPath[0] = 0;
    rec(1, 0);
    
    out();   
}