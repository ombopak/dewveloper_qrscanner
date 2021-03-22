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
                    height: 40,
                  ),
                  ((Get.arguments.code).toLowerCase().contains('http'))
                      ? Column(
                          children: [
                            Text(
                              'QR Code - URL',
                              style: mainTextStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('${Get.arguments.code}',
                                style: mainTextStyle.copyWith(
                                    fontSize: 14, color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 48),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Clipboard.setData(new ClipboardData(
                                            text: '${Get.arguments.code}'));
                                        final snackBar = SnackBar(
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.white,
                                            content: Text(
                                              'URL copied to clipboard',
                                              style: mainTextStyle.copyWith(
                                                  fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text('Copy URL',
                                          style: TextStyle(fontSize: 16))),
                                  ElevatedButton(
                                      onPressed: _launchURL,
                                      child: Text('Open in browser',
                                          style: TextStyle(fontSize: 16)))
                                ],
                              ),
                            ),
                          ],
                        )
                      : ((Get.arguments.code).toLowerCase().contains('tel:'))
                          ? Column(
                              children: [
                                Text(
                                  'QR Code - Phone',
                                  style: mainTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${Get.arguments.code}',
                                    style: mainTextStyle.copyWith(
                                        fontSize: 14, color: Colors.black)),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 48),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Clipboard.setData(new ClipboardData(
                                                text: '${Get.arguments.code}'));
                                            final snackBar = SnackBar(
                                                duration: Duration(seconds: 2),
                                                backgroundColor: Colors.white,
                                                content: Text(
                                                  'Phone number copied to clipboard',
                                                  style: mainTextStyle.copyWith(
                                                      fontSize: 16),
                                                  textAlign: TextAlign.center,
                                                ));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          child: Text('Copy Number',
                                              style: TextStyle(fontSize: 16))),
                                      ElevatedButton(
                                          onPressed: _launchNumber,
                                          child: Text('Call Number',
                                              style: TextStyle(fontSize: 16)))
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : ((Get.arguments.code).toLowerCase().contains('sms'))
                              ? Column(
                                  children: [
                                    Text(
                                      'QR Code - SMS',
                                      style: mainTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('${Get.arguments.code}',
                                        style: mainTextStyle.copyWith(
                                            fontSize: 14, color: Colors.black)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 48),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Clipboard.setData(new ClipboardData(
                                                    text:
                                                        '${Get.arguments.code}'));
                                                final snackBar = SnackBar(
                                                    duration:
                                                        Duration(seconds: 2),
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: Text(
                                                      'SMS copied to clipboard',
                                                      style: mainTextStyle
                                                          .copyWith(
                                                              fontSize: 16),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: Text('Copy SMS',
                                                  style:
                                                      TextStyle(fontSize: 16))),
                                          ElevatedButton(
                                              onPressed: _launchSMS,
                                              child: Text('Send SMS',
                                                  style:
                                                      TextStyle(fontSize: 16)))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : ((Get.arguments.code)
                                      .toLowerCase()
                                      .contains('vcard'))
                                  ? Text(
                                      'QR Code - Contact',
                                      style: mainTextStyle,
                                    )
                                  : ((describeEnum(Get.arguments.format))
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
                  Text('${Get.arguments.code} DEBUGG'),
                  Text(asd),
                  Text('${describeEnum(Get.arguments.format)}')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> asd = Get.arguments.code.toString().split(':');

  _launchURL() async {
    final url = Get.arguments.code.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchNumber() async {
    final url = Get.arguments.code.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchSMS() async {
    final url = Get.arguments.code.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
