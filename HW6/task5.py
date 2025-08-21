from random import randint

inInt = int(input("Введите число: "))#введем число с клавиатуры

if inInt%2 == 0:#если остаток от деления на 2 равен 0, то
    print("Число четное")
else:#иначе
    print("Число нечетное")

randInt = randint(1,20)
print(f"\nРандомное число: {randInt}")

if randInt%2 == 0:#если остаток от деления на 2 равен 0, то
    print("Число четное")
else:#иначе
    print("Число нечетное")