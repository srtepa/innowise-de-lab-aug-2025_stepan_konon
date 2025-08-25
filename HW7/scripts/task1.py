shopping_list = ["milk", "bread", "eggs", "butter", "apples"] #объявляем лист покупок

count = 1 #объявляем счетчик и присваиваем ему значение 1

print("Список покупок:")

for item in shopping_list: #проходимся циклом for по структуре данных
    print(f"{count}. {item}") #f-строка для вывода
    count+=1 #прибаляем единицу к счетчику