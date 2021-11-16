# GetHMACwithCreds
Custom connector for Microsoft Power BI. Creates HMAC for the text and secret key.

Как подключить коннектор:
Скачайте файл: https://github.com/PooHkrd/GetHMACwithCreds/blob/master/GetHMACwithCreds.mez

Перенесите его в папку C:\Users\USERNAME\Documents\Power BI Desktop\Custom Connectors, подставив USERNAME своего компьютера. Если у вас установлен OneDrive, то используйте такую папку: C:\Users\USERNAME\OneDrive\Documents\Power BI Desktop\Custom Connectors. Внимание! При наличии установленного приложения OneDrive, Power BI может не обнаружить коннектор по стандартному адресу.

Откройте Power BI, зайдите в Файл -> Параметры и настройки -> Параметры -> Глобальные -> Безопасность, выберите "Разрешить загрузку любого расширения без проверок и предупреждений".

Нажмите на кнопку "Получить данные", в разделе Другое выберите GetHMACwithCreds.

Для того чтобы коннектор работал в облаке PBI Service, скачайте и установите персональный шлюз Power BI: https://go.microsoft.com/fwlink/?LinkId=2116848&clcid=0x419. В шлюзе авторизуйтесь под своей учётной записью Power BI. Далее проверьте, видит ли шлюз коннекторы, выбрав в шлюзе "Соединители" в левом меню. После этого необходимо будет настроить подключение к коннектору согласно  инструкции: https://docs.microsoft.com/ru-ru/power-bi/connect-data/service-gateway-custom-connectors
Внимание! Если при настройке подключения будет выбран способ авторизации Anonymous то необходимо отметить чек-бокс "Пропустить тестирование кодключения", иначе подключение может выдавать ошибку. При пропуске тестирования коннектор будет корректно работать в облаке.
В потоках данных пользовательские коннекторы не работают.
