// This file contains your Data Connector logic
section GetHMACwithCreds;

[DataSource.Kind="GetHMACwithCreds", Publish="GetHMACwithCreds.Publish"]
shared GetHMACwithCreds.Contents = Value.ReplaceType(GetHMACwithCredsImpl, GetHMACwithCredsType);

GetHMACwithCredsType = type function (
    optional query  as (type text meta [
        DataSource.Path = false,
        Documentation.FieldCaption = "Query",
        Documentation.FieldDescription = if Date.ToText(#date(2021,1,1),"MMM")="янв"
            then "Запрос, который вы хотите Объединить с секретным ключом и получить HMAC"
            else "The request you want to combine with the secret key and get HMAC",
        Documentation.SampleValues = {"recvWindow=5000&timestamp=1499827319559"}        
        ]
        ),
    optional APIkey as (type text meta [
        DataSource.Path = false,
        Documentation.FieldCaption = "APIkey",
        Documentation.FieldDescription = if Date.ToText(#date(2021,1,1),"MMM")="янв"
            then "ВНИМАНИЕ! Это не безопасно! Здесь указывается секретный ключ, в случае если вы хотите передавать его функции в явном виде. Рекомендуется использовать тип авторизации Key или Basic и передавать ключ через пароль!"
            else "Attention! It's not safe! The secret key is specified here, if you want to pass its functions explicitly. It is recommended to use the Key or Basic authorization type and pass the key through a password!",
        Documentation.SampleValues = {"Key"}        
        ]
        )
    )
    as text meta [
        Documentation.Name = "GetHMACwithCreds.Contents",
        Documentation.LongDescription = if Date.ToText(#date(2021,1,1),"MMM")="янв"
            then "Функция генерирует HMAC (hash-based message authentication code) на основе алгоритма хэширования SHA256 для двух аргументов: Query и APIkey. Если первый аргумент пропустить, либо ввести в него null, то функция вернет пустую строку "". Если второй аргумент пропустить, либо ввести в него null и при этом использовать тип авторизации Anonymous, то функция вернет пустую строку "". Второй аргумент рекомендуется передавать в функцию через учетные данные используя тип авторизации Key или Basic. Если используется тип авторизации Key то вы вводите в учетные данные только секретный ключ, а функция забирает его уже из учетных данных самостоятельно. Если используется тип авторизации Basic, то вам нужно будет вносить логин и пароль, логин в данном случае никак не используется внутри функции, а пароль функция заберет и использует в качестве секретного ключа."
            else "The function generates HMAC (hash-based message authentication code) based on the SHA256 hashing algorithm for two arguments: Query and APIkey. If you skip the first argument, or enter null into it, the function returns an empty string "". If you skip the second argument, or enter null into it and use the Anonymous authorization type, the function returns an empty string "". The second argument is recommended to be passed to the function via credentials using the authorization type Key or Basic. If the Key authorization type is used, then you enter only the secret key into the credentials, and the function takes it from the credentials itself. If the Basic authorization type is used, then you will need to enter a login and password, the login in this case is not used in any way inside the function, and the function will take the password and use it as a secret key.",
        Documentation.Examples = {[
            Description = if Date.ToText(#date(2021,1,1),"MMM")="янв"
            then "Возвращает HMAC SHA256 для запроса и секретного ключа"
            else "Returns HMAC SHA256 for the request and the secret key.",
            Code = "GetHMACwithCreds.Contents(""recvWindow=5000&timestamp=1499827319559"", ""Key"")",
            Result = "38cb42438b6315362571f5d359b5f8b2ead3e61780617a9bba1b9853e9f22701"
        ]}
    ];


GetHMACwithCredsImpl = (optional query as text, optional APIkey as text) as text =>
    let
        Credential = Extension.CurrentCredential(),
        APIKey = if APIkey = null then Credential[Password] else APIkey,
        ToBinA = (t)=> Text.ToBinary(Text.Combine({t,""}), TextEncoding.Utf8),
        Encrypt = Crypto.CreateHmac( CryptoAlgorithm.SHA256, ToBinA(APIKey), ToBinA(query) ),
        ToText = if query = null or APIKey = null then "" else Binary.ToText( Encrypt, BinaryEncoding.Hex )
    in
        ToText;

// Data Source Kind description
GetHMACwithCreds = [
    TestConnection = (dataSourcePath) => { "GetHMACwithCreds.Contents" },
    Authentication = [
        Anonymous = [],
        Key = [],
        UsernamePassword = []
    ]//, 
//     Label = "GetHMACwithCreds"
    
];

// Data Source UI publishing description
GetHMACwithCreds.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = GetHMACwithCreds.Icons,
    SourceTypeImage = GetHMACwithCreds.Icons
];

GetHMACwithCreds.Icons = [
    Icon16 = { Extension.Contents("GetHMACwithCreds16.png"), Extension.Contents("GetHMACwithCreds20.png"), Extension.Contents("GetHMACwithCreds24.png"), Extension.Contents("GetHMACwithCreds32.png") },
    Icon32 = { Extension.Contents("GetHMACwithCreds32.png"), Extension.Contents("GetHMACwithCreds40.png"), Extension.Contents("GetHMACwithCreds48.png"), Extension.Contents("GetHMACwithCreds64.png") }
];
