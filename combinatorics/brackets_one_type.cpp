// Выведите все правильные скобочные последовательности из 2n скобок в лексикографическом порядке.

// Входные данные
// Натуральное число n

// Выходные данные
// Выведите правильные скобочные последовательности в лексикографическом порядке. Считайте, что ‘(’ < ‘)’.
// Каждая последовательность должна выводиться в отдельной строке.

// Пример входных данных
// 3
// Пример выходных данных
// ((()))
// (()())
// (())()
// ()(())
// ()()()

#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector<char> a;
int line_counter = 1;
int n = 10;

void out()
{
        cout << line_counter << ": ";
        for(int i = 0; i < 2 * n; i++)
        {
            if (i)
                cout << " ";
            cout << a[i];
        }
        cout << endl;
        line_counter += 1;
}

void rec(int idx, int bal)
{
    if (idx >= 2 * n) {
        if (bal == 0)
            out();
        return;
    }

    a[idx] = '(';
    rec(idx + 1, bal + 1);

    if (bal == 0)
        return;

    a[idx] = ')';
    rec(idx + 1, bal - 1);
}

int main()
{
    a = vector<char>(2 * n);
    rec(0, 0);
}