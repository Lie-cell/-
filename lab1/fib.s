    .section .text
    .globl main

main:
    addi sp, sp, -32         # 为栈帧分配32字节的空间
    li a0, 6                 # a0 = 6，n = 6

    li t0, 0                 # t0 = 0，表示斐波那契的初始值a
    li t1, 1                 # t1 = 1，表示斐波那契的初始值b

    li t2, 0                 # t2 = 0，临时变量存储斐波那契数列值fib
    li t3, 2                 # t3 = 2，循环计数器i

    beq a0, t0, return_zero  # 如果n == 0，返回0
    beq a0, t1, return_one   # 如果n == 1，返回1

fib_loop:
    ble a0, t3, end_main     # 如果i > n，跳转到end_main
    add t2, t0, t1           # fib = a + b
    mv t0, t1                # a = b
    mv t1, t2                # b = fib
    addi t3, t3, 1           # i++

    j fib_loop               # 继续循环

return_zero:
    li a0, 0                 # 返回0
    j end_main

return_one:
    li a0, 1                 # 返回1
    j end_main

end_main:
    mv a0, t2                # 返回fib的值
    addi sp, sp, 32          # 释放栈帧空间
    jr ra                    # 返回

