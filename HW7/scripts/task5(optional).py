width = int(input("Введите ширину прямоугольника: "))#считываем ширину и высоту
hight = int(input("Введите высоту прямоугольника: "))

for hig in range(hight): #проходимся по строкам
    for wid in range(width):#проходимся по столбцам
        print("*", end=' ')
    print()