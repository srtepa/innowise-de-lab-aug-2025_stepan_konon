# Исходный список: fruits = ["apple", "banana"]
# Выполните следующие операции по порядку:
# 1. Добавьте "orange" в конец списка
# 2. Вставьте "grape" по индексу 1
# 3. Удалите "banana"
# 4. Отсортируйте список
# 5. Переверните список
# Выводите список на печать после каждого шага


fruits = ["apple", "banana"]
print(f"наш список сейчас: {fruits}")

fruits.append("orange")
print(f"наш список сейчас: {fruits}")

fruits.insert(1, "grape")
print(f"наш список сейчас: {fruits}")

fruits.pop(fruits.index("banana"))
print(f"наш список сейчас: {fruits}")
#fruits.remove("banana")
#print(f"4. После удаления 'banana': {fruits}")
#также можно сделать проще, в метод передавать другой возвращающий метод

fruits.sort()
print(f"наш список сейчас: {fruits}")

fruits.reverse()
print(f"наш список сейчас: {fruits}")

#в данном коде все чисто и понятно, все действия были сделаны
#чисто по ТЗ, поэтому считаю, что комментарии излишне

