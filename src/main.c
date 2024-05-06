#include "add.h"
#include "hello.h"
#include "sub.h"
#include <stdio.h>

int main(void) {
    printf("%d\n", add(1, 2));
    printf("%d\n", sub(1, 2));
    hello();

    return 0;
}
