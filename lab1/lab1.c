#include <stdio.h>
#define pi 3
int main() {
    int a, b, i, t, n;
    a = 0;
    b = 1;
    i = 1;
    printf("%d\n", pi);
    scanf("%d", &n);
    printf("%d\n", a);
    printf("%d\n", b);
    while (i < n) {//123
        t = b;
        b = a + b;
        printf("%d\n", b);
        a = t;
        i++;
    }
    return 0;
}
