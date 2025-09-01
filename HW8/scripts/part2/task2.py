# Дан повторяющийся код расчёта цены с НДС:
# prices = [1000, 3499, 250]
# nds = 0.20
# print(prices[0] + prices[0] * nds)
# print(prices[1] + prices[1] * nds)
# print(prices[2] + prices[2] * nds)
#
# Задание:
# 1) Вынесите расчёт в функцию add_vat().
# 2) Примените её ко всем элементам списка в цикле и распечатайте
# итоговые цены, используйте цикл.

prices = [1000, 3499, 250]
nds = 0.20

def add_vat(prices, add):
    result = [] #объявим результирующий лист
    #в данной функции мы примем лист значений цен без НДС. запишем в новый лист значения с НДС
    for price in prices:
        result.append(price + price*add)#дополним result новым значением

    print(f"Наш список цен с НДС: {result}")

print(f"Список цен без НДС: {prices}")
add_vat(prices, nds)