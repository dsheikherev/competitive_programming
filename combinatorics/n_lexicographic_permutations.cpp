// Выведите в лексикографическом порядке все перестановки чисел от 1 до n.

// Входные данные
// Натуральное число n.
// Выходные данные
// Выведите перестановки в лексикографическом порядке, каждую перестановку - в отдельной строке.
// Числа в перестановках должны разделяться одиночными пробелами.

// Пример входных данных
// 3
// Пример выходных данных
// 1 2 3
// 1 3 2
// 2 1 3
// 2 3 1
// 3 1 2
// 3 2 1
// В качестве ответа на задание выберите перестановку для 
// n = 7 с номером 4468 в лексикографическом порядке.
// Для примера из условия перестановка с номером 4 имеет вид “2 3 1”.

#include <iostream>
#include <vector>
#include <string>

using namespace std;

int n = 7;
vector<int> a;
vector<bool> used;

int line_number = 1;

void print_variant() {
    cout << line_number << ": ";
    for (int i = 0; i < n; i++) {
        if (i)
            cout << " ";
        cout << a[i];
    }
    cout << endl;
    line_number += 1;
}

void rec(int idx) {
    if (idx == n) {
        print_variant();
        return;
    }
    for (int i = 1; i <= n; i++) {
        if (used[i])
            continue;
        used[i] = true;
        a[idx] = i;
        rec(idx + 1);
        used[i] = false;
    }
}

int main() {
    a = vector<int>(n + 1);
    used = vector<bool>(n + 1, false);

    rec(0);

    return 0;
}