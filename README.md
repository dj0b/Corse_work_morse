# Corse_work_morse
morse transmitter/receiver on Verilog 

Базове завдання
Спроектувати та протестувати передавач та приймач сповіщень азбукою Морзе (використовувати кодування літер для англійського алфавіту).
По зовнішньому сигналу «старт» передавач повинен сформувати та надіслати сповіщення, яке містить прізвище та ім’я студента і номер академічної групи.
Приймач повинен прийняти сповіщення та дешифрувати його (перекодувати сповіщення у формат ASCII).  Для зупинки приймача використовується знак «кінець передачі».


Ускладнене завдання
	Сповіщення, що надсилається, зчитується з блоку пам’яті. Сповіщення, що приймається, теж зберігається у блоці пам’яті.

На рисунку представлено кодування літер та символів азбукою Морзе (крапки – тире), та форму електричного сигналу для передачі символів азбукою Морзе.
Тривалість сигналу для кодування крапки та тире обирається користувачем. Необхідно витримати наступну умову – тривалість тире втричі перевищує тривалість крапки.
Таблицю кодування літер у форматі ASCII можна переглянути за наступним посиланням: https://uk.wikipedia.org/wiki/ASCII  
Спосіб представлення прийнятого сповіщення на виході приймача обирається користувачем самостійно.
