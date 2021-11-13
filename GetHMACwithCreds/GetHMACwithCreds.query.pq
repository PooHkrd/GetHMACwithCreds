// Use this file to write queries to test your data connector
let
    cred = "a@a.a",
    rec = [ /*symbol="LTCBTC",
            side="BUY",
            type="LIMIT",
            timeInForce="GTC",
            quantity="1",
            price="0.1",*/
            recvWindow="5000",
            timestamp="1499827319559"],
    string = Uri.BuildQueryString( rec ),
    key = "Key",
    result = GetHMACwithCreds.Contents(string)
in
    result