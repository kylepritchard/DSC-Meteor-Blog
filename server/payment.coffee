
# code = '@2DCD27338114D4C39A14A855702FBAB2EF40BCAC2D76A3ABC0F660A07E9C1C921C2C755BA9B59C39F882FBF6DFED114F23141D94E50A01A665B1E31A86C07CA1CD1BB8EF5B6CF2C23D495CD
# 79F9C0F678D61773E7A1AA30AA5B23D56503FC0B52AC0694A8C341263D2C5FE1BAD93BDB94726761E155E900448F644AF1F67BE1AC77E852B9D90809A44F258EE9478B6D8C1C4ED58759263E7DBF
# 8871C6592287C0358F36F4EEC326CEDDD440DA2FED8AB35F1B630A5C6FA671E4D78CC8CACECF9DFDC31D6C5EC8270FB21E297E2C2E14F99A04223EFFD4F00062D440E78A3D2C7140EC8F123D24
# 7B75E7482AE98858DA34D37EDE6D7C69AA74391F559305CF675ADB3615244A107ABBB6AF26E29A2FFA059B12688D90FE09E0DE069325BFF3587A695F5DA36E4B809B69CC9A37034F166B63B5A62
# B986F4DA34E9AC9516AFDE70642EC7DAD1AEBA93A1F347D6AC7046E967DCBFE7ACFCEE5DAFC0B29F1765032B3060EBE565CBD57D092075D15CF12725199C6881605B2E0F105698CE3ADD04361C
# A9D620C187B90E3F9849445B5C3C0FDF1768BFFD61F97E51316826F4F10E0E3E668F0A9F5ED9CCDA6F2C7CC957F12DB48F9041482E3D035E7A91852C404BFA325FED947E71F57B871DFAC6AF4FF2
# 9F4513A4A80B2D7ECC9D19D47ED04FA99CDFC881DFA771E1EA4F3F9B2C5AC673EF3DA2699A309CC8522993A63CB8D45D3CDF09B1DFDC573CD19679B250AD6721450B5042F201670B464505DCAE
# F59E2C67ABACC9AE2EEE793CE191FEBF66B8FAF4204EFFB359246B9C99FB52805C46375FF35140F74707FBC73C7731A28A2C883A'

# string = 'VendorTxCode=TxCode-1310917599-223087284&Amount=36.95&Currency=GBP&Description=description&CustomerName=Fname Surname&CustomerEMail=customer@example.com&BillingSurname=Surname&BillingFirstnames=Fname&BillingAddress1=BillAddress Line 1&BillingCity=BillCity&BillingPostCode=W1A 1BL&BillingCountry=GB&BillingPhone=447933000000&DeliveryFirstnames=Fname&DeliverySurname=Surname&DeliveryAddress1=BillAddress Line 1&DeliveryCity=BillCity&DeliveryPostCode=W1A 1BL&DeliveryCountry=GB&DeliveryPhone=447933000000&SuccessURL=https://example.com/success&FailureURL=https://example.com/failure'
#
# crypto = Meteor.npmRequire 'crypto'
#
# algorithm = 'aes-128-cbc'
# password = '55a51621a6648525'
# iv = '55a51621a6648525'
#
# cipher = crypto.createCipheriv(algorithm, password, iv)
# crypted = cipher.update(string, 'utf8','hex')
# crypted += cipher.final('hex')
#
# bigcrypted = '@' + crypted.toUpperCase()
#
# # check = (bigcrypted, code) ->
# #     if bigcrypted == code
# #         console.log 'match'
#
# console.log bigcrypted
