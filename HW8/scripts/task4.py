# Дано: words = ["hello", "world", "python", "code"]
# 1. Создать список длин слов, используя списковое включение
# 2. Создать список слов длиннее 4 символов
# 3. Создать словарь: {слово: длина} для всех слов

words = ["hello", "world", "python", "code"]

lengths = [len(x) for x in words]#с помощью генератора списков создали ноавй
print(f"список длин слов в листе: {lengths}")

long_words = [i for i in words if len(i)>4]#то же самое, но с условием
print(f"новый лист со словами длиннее 4 символов: {long_words}")

dictionary = {}#объявили словарь

for item in words:#проходимся циклом по списку
    dictionary[item] = len(item)#добавляем новый элемент в словарь

print(dictionary)