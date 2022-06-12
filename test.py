import requests
import json

# import checksum generation utility
# You can get this utility from https://developer.paytm.com/docs/checksum/
from paytmchecksum import generateSignature, PaytmChecksum

# initialize a dictionary
paytmParams = dict()

# body parameters
paytmParams["body"] = {

    # Find your MID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
    # "mid": "EqSYeb01896677709760",
    "mid": "ymbiZL28444864151962",

    # Enter your order id which needs to be check status for
    "orderId": "T2206070957251815411291",
}

# Generate checksum by parameters we have in body
# Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
checksum = generateSignature(json.dumps(paytmParams["body"]),
                             "BNt#8MGpC@qrGAca")

print(checksum, "chek++++ß")
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