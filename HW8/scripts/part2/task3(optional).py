#Создайте функцию calculate_average_score(), которая будет вычислять средний балл.
#Функция должна принимать список оценок scores как обязательный аргумент.
#Добавьте опциональный булевый параметр ignore_lowest со значением по умолчанию False.
#Если ignore_lowest равен True, функция должна отбросить наименьшую оценку
#перед вычислением среднего. Если в списке всего одна оценка, отбрасывать её не нужно.
#Используя цикл, пройдитесь по списку student_data. 2 раза, первый раз
#учитывая все оценки, а второй раз отбросив худшие оценки


#данное задание было разбито на ф-ции, чтобы соответствовать DRY

student_data = [
    {'name': 'Саша', 'scores': [85, 72, 98, 100]},
    {'name': 'Алла', 'scores': [80, 12, 55, 76]},
    {'name': 'Яна', 'scores': [67, 37, 55, 80]},
    {'name': 'Степа', 'scores': [100, 98, 96, 94]},
    {'name': 'Даниэль', 'scores': [78, 56, 68, 62]}
]

def calculate_average_score(student_data, ignore_lowest = False): #обязательный арг-т - students, а второй - необязательный
    #cоздадим глубокую копию, чтобы не изменять оригинальные данные (т.к. они являются ссылками)
    students = []
    for student in student_data:
        students.append({
            'name': student['name'],
            'scores': student['scores'].copy()
        })

    if not ignore_lowest:#отсутствие необязательного аргумента (default значение)
        print("учащиеся и их средние баллы (с учетом худшей оценки)")
        for item in students:#проходимся по списку словарей
            print_average_score(item)#выводим рез-т
        print()
    else:
        print("учащиеся и их средние баллы (без учетом худшей оценки)")
        for item in students:
            if len(item['scores']) == 1:
                print_average_score(item)
            else:
                item['scores'].remove(min(item['scores']))#удаление минимального значения
                print_average_score(item)
        print()

def average_score(scores): #вспомогательная ф-ция для расчета ср. балла
    count =0
    sum =0

    for score in scores:
        sum+=score
        count+=1

    return sum/count

def print_average_score(item): #ф-ция для вывода в консоль
    print(f"у студента {item['name']} средний балл составляет {average_score(item['scores'])}")

print("Учащиеся и их оценки:")
for item in student_data:
    print(f"учащийся: {item['name']}, оценцки: {item['scores']}")
print()

calculate_average_score(student_data)
calculate_average_score(student_data, True)