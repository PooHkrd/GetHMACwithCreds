# GetHMACwithCreds
ENG. Custom connector for Microsoft Power BI. Creates HMAC for the text and secret key.

How to use the connector:
Download the file: https://github.com/PooHkrd/GetHMACwithCreds/blob/master/GetHMACwithCreds.mez

Move it to a folder C:\Users\USERNAME\Documents\Power BI Desktop\Custom Connectors by substituting the USERNAME of your credentials. If you have OneDrive installed, then use the following folder: C:\Users\USERNAME\OneDrive\Documents\Power BI Desktop\Custom Connectors. Attention! If the OneDrive application is installed, Power BI may not detect the connector at the standard folder.

Open Power BI, go to File -> Options and Settings -> Settings -> Global -> Security, select "Allow downloading of any extension without checks and warnings".

Click on the "Get data" button, in the Other section, select GetHMACwithCreds.

In order for the connector to work in the PBI Service cloud, download and install the Power BI personal gateway: https://go.microsoft.com/fwlink/?LinkId=2116848&clcid=0x419. Log in to the gateway with your Power BI account. Next, check whether the gateway sees the connector by selecting "Connectors" in the gateway in the left menu. After that, you will need to configure the connection to the connector according to the instructions: https://docs.microsoft.com/ru-ru/power-bi/connect-data/service-gateway-custom-connectors
Attention! If the Anonymous authorization method is selected when setting up the connection, then it is necessary to mark the "Skip Test Connection" checkbox, otherwise the connection may give an error. If you skip testing, the connector will work correctly in the cloud.
Custom connector do not work in data flows.

RUS. Пользовательский коннектор для Microsoft Power BI. Создает HMAC (hash-based message authentication code) для текста и секретного ключа.
Как подключить коннектор:
Скачайте файл: https://github.com/PooHkrd/GetHMACwithCreds/blob/master/GetHMACwithCreds.mez

Перенесите его в папку C:\Users\USERNAME\Documents\Power BI Desktop\Custom Connectors, подставив USERNAME своего компьютера. Если у вас установлен OneDrive, то используйте такую папку: C:\Users\USERNAME\OneDrive\Documents\Power BI Desktop\Custom Connectors. Внимание! При наличии установленного приложения OneDrive, Power BI может не обнаружить коннектор по стандартному адресу.

Откройте Power BI, зайдите в Файл -> Параметры и настройки -> Параметры -> Глобальные -> Безопасность, выберите "Разрешить загрузку любого расширения без проверок и предупреждений".

Нажмите на кнопку "Получить данные", в разделе Другое выберите GetHMACwithCreds.

Для того чтобы коннектор работал в облаке PBI Service, скачайте и установите персональный шлюз Power BI: https://go.microsoft.com/fwlink/?LinkId=2116848&clcid=0x419. В шлюзе авторизуйтесь под своей учётной записью Power BI. Далее проверьте, видит ли шлюз коннектор, выбрав в шлюзе "Соединители" в левом меню. После этого необходимо будет настроить подключение к коннектору согласно  инструкции: https://docs.microsoft.com/ru-ru/power-bi/connect-data/service-gateway-custom-connectors
Внимание! Если при настройке подключения будет выбран способ авторизации Anonymous то необходимо отметить чек-бокс "Пропустить тестирование кодключения", иначе подключение может выдавать ошибку. При пропуске тестирования коннектор будет корректно работать в облаке.
В потоках данных пользовательские коннекторы не работают.
