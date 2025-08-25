from random import randint

print("Ну что, начнем!")

refRandom = randint(1, 10) #рандомно выбираем интовое число

print("Программа загадала число. Теперь вы!")
print()

flagGuess = False #флаг для отслеживания угадывания

while not flagGuess:
    myInt = int(input("Введите ваше число: "))

    if myInt == refRandom:#если числа идентичны по значению
        flagGuess = True#выставляем флаг True
        print(f"Вы угадали! Рандомное число {refRandom} схоже с вашим {myInt}")
        print()