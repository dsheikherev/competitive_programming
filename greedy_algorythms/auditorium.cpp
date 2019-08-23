// Задача о выборе заявок.
// Имеется аудитория и n заявок на проведение занятий в ней. Каждая заявка -
// это временной интервал [li,ri), причем левая граница включается в интервал,
// а правая - нет. Нужно выбрать наибольшее число заявок, чтобы они не пересекались по времени.

// Входные данные
// В первой строке задано целое число n - количество заявок. Следующие n строк описывают заявки: 
// i-я строка содержит два целых числа - l[i] и r[i].
// Выходные данные
// Выведите одно целое число - наибольшее число заявок, которые можно удовлетворить.

// Пример входных данных
// 3
// 1 5
// 3 6
// 5 7
// Пример выходных данных
// 2

#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<int> l;
vector<int> r;

int n;
long cnt;

void out() {
   cout << cnt << endl;
}

void swap(vector<int> &a, int i, int j) {
    int tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
}

void insertion_sort() {
    int min_index;
    for (int i = 0; i < n; i++) {
        for (int j = i; j > 0; j--) {
            if (r[j] < r[j - 1]) {
                swap(l, j, j - 1);
                swap(r, j, j - 1);
            } else {
                break;
            }
        }
    }
}

void count() {
    int last = 0;
    for (int i = 1; i < n; i++) {
        if (l[i] >= r[last]) {
            cnt++;
            last = i;
        }
    }
}

// ifstream input("greedy_algorythms/request1.in");
ifstream input("greedy_algorythms/request2.in");

int main() {
    input >> n;

    l = vector<int>(n);
    r = vector<int>(n);

    for (int i = 0; i < n; i++) {
        input >> l[i];
        input >> r[i];
    }

    cnt = 1;
    insertion_sort();
    count();
    out();   
}