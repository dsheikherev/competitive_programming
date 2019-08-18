// Расстановка фишек.
// Имеется полоса размера 1×n, разбитая на единичные клетки.
// Нужно расставить в клетках полосы m фишек, чтобы никакие две фишки не стояли в соседних клетках. Выведите все возможные расстановки.

// Входные данные
// Натуральные числа n и m.

// Выходные данные
// Выведите все корректные расстановки фишек. Каждая расстановка должна быть выведена в отдельной строке.
// Клетки, занятые фишками, обозначаются символами ‘*’, свободные клетки - точками ‘.’.
// Выводите расстановки в лексикографическом порядке, считая, что ‘*’ < ‘.’.

// Пример входных данных
// 5 2
// Пример выходных данных
// 1) *.*..
// 2) *..*.
// 3) *...*
// 4) .*.*.
// 5) .*..*
// 6) ..*.*

#include <iostream>
#include <vector>
#include <string>

using namespace std;

int n = 7;
int m = 3;
int line_number = 1;

vector<char> a;

void print_variant() {
    cout << line_number << ":";
    for (int i = 0; i < n; i++) {
        if (a[i])
            cout << " ";
        cout << a[i];
    }
    cout << endl;
    line_number += 1;
}

void rec(int idx, int sum) {

    if (idx == n) {
        if (sum == m)
            print_variant();
        return;
    }

    if (idx == 0 || a[idx - 1] == '.') {
        a[idx] = '*';
        rec(idx + 1, sum + 1);
    }

    a[idx] = '.';
    rec(idx + 1, sum);
}

int main() {
    int rule = (n - 1) / 2 + 1;
    if (m > rule) {
        cout << "Mission impossible";
        return 1;
    }
    a = vector<char>(n);

    rec(0, 0);
    return 0;
}