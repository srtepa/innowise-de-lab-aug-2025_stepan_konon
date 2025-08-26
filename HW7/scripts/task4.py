def total_score(scores):
    total = 0

    for score in scores: #проходимся по листу
        if score<0:
            continue#пропускаем данную итерацию

        if score==0:
            print("Обработка прервана.")
            break#прерываем итерацию и выходим из цикла

        total += score#считаем в одной переменной сумму балов
        print(f"Добавлен балл: {score}")

    else:
        print("Все данные обработаны")

    print(f"\nИтоговая сумма баллов: {total}\n")

scores = [75, 88, -10, 95, 100, -25, 89] #проверка1
total_score(scores)

scores = [75, 88, 95, 0, 100] #проверка2
total_score(scores)