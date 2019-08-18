// Задача о расписании.
// У программиста есть n заказов. Для каждого заказа известны дедлайн d[i]  - срок,
// до которого нужно выполнить заказ, и стоимость заказа c[i]. На выполнение каждого заказа требуется один день.
// Программист начинает работать с 1-го дня, и если у заказа дедлайн d[i],
// то этот заказ нужно выполнить до конца d[i]-го дня. Например, если дедлайн равен 1,
// то программист успеет выполнить этот заказ в первый день. Нужно составить оптимальное расписание -
// определить, какие заказы программист может выполнять и в каком порядке,
// чтобы максимизировать суммарную стоимость выполненных заказов.

// Входные данные
// В первой строке задано число n - количество заказов.
// Следующие n строк содержат описания заказов:
// i-я строка содержит два целых числа - дедлайн d[i] и стоимость c[i].
// Выходные данные
// Выведите одно целое число - максимальную суммарную стоимость выполненных заказов.

// Пример входных данных
// 5
// 2 5
// 2 4
// 5 3
// 1 2
// 3 1
// Пример выходных данных
// 13

#include <fstream>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector<int> c;
vector<int> d;
vector<bool> used;

int n;
long long sum;

void out() {
   cout << sum << endl;
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
            if (c[j] > c[j - 1]) {
                swap(c, j, j - 1);
                swap(d, j, j - 1);
            } else {
                break;
            }
        }
    }
}

void count() {
    for (int i = 0; i < n; i++) {
        int k = d[i];
        while(k >= 1 && used[k])
            k--;
        if (k == 0) continue;
        used[k] = true;
        sum += c[i];
    }
}

// ifstream input("greedy_algorythms/schedule1.in");    
ifstream input("greedy_algorythms/schedule2.in");

int main() {
    input >> n;

    used = vector<bool>(n + 1, false);   
    c = vector<int>(n);
    d = vector<int>(n);

    for (int i = 0; i < n; i++) {
        input >> d[i];
        input >> c[i];
    }

    sum = 0;
    insertion_sort();
    count();
    out();   
}