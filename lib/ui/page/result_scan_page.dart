part of 'pages.dart';

class ResultScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ((Get.arguments.code).toLowerCase().contains('http'))
                      ? Text(
                          'QR Code - URL',
                          style: mainTextStyle,
                        )
                      : ((Get.arguments.code).toLowerCase().contains('tel:'))
                          ? Text(
                              'QR Code - Phone',
                              style: mainTextStyle,
                            )
                          : ((Get.arguments.code).toLowerCase().contains('sms'))
                              ? Text(
                                  'QR Code - SMS',
                                  style: mainTextStyle,
                                )
                              : ((Get.arguments.code)
                                      .toLowerCase()
                                      .contains('vcard'))
                                  ? Text(
                                      'QR Code - Contact',
                                      style: mainTextStyle,
                                    )
                                  : ((Get.arguments.code)
                                          .toLowerCase()
                                          .contains('ean13'))
                                      ? Text(
                                          'Barcode - Item',
                                          style: mainTextStyle,
                                        )
                                      : ((Get.arguments.code)
                                              .toLowerCase()
                                              .contains('wifi'))
                                          ? Text(
                                              'QR Code - WIFI',
                                              style: mainTextStyle,
                                            )
                                          : ((Get.arguments.code)
                                                  .toLowerCase()
                                                  .contains('msg'))
                                              ? Text(
                                                  'QR Code - eMail',
                                                  style: mainTextStyle,
                                                )
                                              : ((Get.arguments.code)
                                                      .toLowerCase()
                                                      .contains('bitcoin'))
                                                  ? Text(
                                                      'QR Code - Bitcoin',
                                                      style: mainTextStyle,
                                                    )
                                                  : ((Get.arguments.code)
                                                          .toLowerCase()
                                                          .contains('event'))
                                                      ? Text(
                                                          'QR Code - Event',
                                                          style: mainTextStyle,
                                                        )
                                                      : Text(
                                                          'Text',
                                                          style: mainTextStyle,
                                                        ),
                  Text('${Get.arguments.code}'),
                  //Text('${describeEnum(Get.arguments.format)}')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
