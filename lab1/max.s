    .section .text
    .globl main

main:
    addi sp, sp, -32         # 为栈帧分配32字节的空间
    la a0, arr               # a0 = arr的地址
    lw s0, 0(a0)             # s0 = arr[0]，初始化result
    li s1, 1                 # s1 = 1，作为循环变量i

find_max_loop:
    li t0, 5                 # t0 = 数组长度5
    bge s1, t0, end_main     # 如果i >= 5，跳转到end_main
    slli t1, s1, 2           # 计算arr[i]的地址偏移，t1 = i * 4
    add t1, a0, t1           # t1 = &arr[i]
    lw t2, 0(t1)             # t2 = arr[i]
    blt s0, t2, update_max   # 如果result < arr[i]，跳转到update_max

next_iteration:
    addi s1, s1, 1           # i++
    j find_max_loop          # 跳转到下一次循环

update_max:
    mv s0, t2                # result = arr[i]
    j next_iteration          # 继续循环

end_main:
    mv a0, s0                # 返回result
    addi sp, sp, 32          # 释放栈帧空间
    jr ra                    # 返回

    .section .data
arr:
    .word 3, 1, 4, 1, 5      # 初始化数组

