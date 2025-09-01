#Дано: email = " USER@DOMAIN.COM "
#1. Очистить и отформатировать до вида: "user@domain.com"
#2. Разделить на имя пользователя и домен
#3. Используя f-строку, создать: "Username: user, Domain: domain.com"

email = " USER@DOMAIN.COM "

cleaned_email = email.strip().lower() #удаление пробелов в начале и конце, приведение в нижний регистр

char_after_name = cleaned_email.find("@")#находим индекс символа @
username, domain = cleaned_email.split("@")#разделяем строки

print(f"Username: {username}, Domain: {domain}")#вывод в консоль
