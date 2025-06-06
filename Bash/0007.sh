#!/bin/bash

is_prime() {
    local n=$1
    if (( n <= 1 )); then
        return 1
    elif (( n == 2 )); then
        return 0
    elif (( n % 2 == 0 )); then
        return 1
    fi

    local i
    for (( i=3; i*i<=n; i+=2 )); do
        if (( n % i == 0 )); then
            return 1
        fi
    done
    return 0
}

target=10001
count=0
num=1

while (( count < target )); do
    ((num++))
    if is_prime "$num"; then
        ((count++))
    fi
done

echo "10,001st prime: $num"