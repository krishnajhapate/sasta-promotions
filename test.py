import requests
import json

# import checksum generation utility
# You can get this utility from https://developer.paytm.com/docs/checksum/
import paytmchecksum

# initialize a dictionary
paytmParams = dict()

# body parameters
paytmParams["body"] = {

    # Find your MID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
    "mid": "DjuTWZ44811387175510",

    # Enter your order id which needs to be check status for
    "orderId": "20220304111212800110168413412566319",
}

# Generate checksum by parameters we have in body
# Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
checksum = paytmchecksum.generateSignature(json.dumps(paytmParams["body"]),
                                           "YjCep_e3heca4SWi")

# head parameters
paytmParams["head"] = {

    # put generated checksum value here
    "signature": checksum
}

# prepare JSON string for request
post_data = json.dumps(paytmParams)

# for Staging
url = "https://securegw-stage.paytm.in/v3/order/status"

# for Production
# url = "https://securegw.paytm.in/v3/order/status"

response = requests.post(url,
                         data=post_data,
                         headers={
                             "Content-type": "application/json"
                         }).json()

print(response)

{
    'head': {
        'responseTimestamp':
        '1646368543455',
        'version':
        'v1',
        'signature':
        'l6SF6t13nzSxO1OoFqF2qWMWuMjVvuGWOaDfI7u9ZioNpCM6tXWP+IEGyUF+QVWX0y0qtVoTcHjMaGwLMg2EYiNRu5LyWcs6uyngSTrVZMo='
    },
    'body': {
        'resultInfo': {
            'resultStatus': 'TXN_FAILURE',
            'resultCode': '334',
            'resultMsg': 'Invalid Order Id.'
        },
        'orderId': '20220304111212800110168413412566319',
        'mid': 'UgHuyf92866898213479'
    }
}
{
    "head": {
        "responseTimestamp": "1553496322922",
        "version": "v1",
        "clientId": "C11",
        "signature": "xxxxx"
    },
    "body": {
        "resultInfo": {
            "resultStatus": "TXN_SUCCESS",
            "resultCode": "01",
            "resultMsg": "Txn Success"
        },
        "txnId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "bankTxnId": "xxxxxxxxxxxxxxx",
        "orderId": "xxxxxxx",
        "txnAmount": "100.00",
        "txnType": "SALE",
        "gatewayName": "HDFC",
        "bankName": "HSBC",
        "mid": "xxxxxxxxxxxxxxxxxxxx",
        "paymentMode": "CC",
        "refundAmt": "100.00",
        "txnDate": "2019-02-20 12:35:20.0",
        "authRefId": "50112883"
    }
}
