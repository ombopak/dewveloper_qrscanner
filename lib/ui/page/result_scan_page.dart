part of 'pages.dart';

class ResultScanPage extends StatelessWidget {
  final String result;

  ResultScanPage({this.result});
  @override
  Widget build(BuildContext context) {
    String result = Get.arguments.code;
    List<String> resultsplit = result.split(':');
    List<String> resultWifi = result.split(';');
    List<String> resultMail = result.split(':');
    resultMail.remove('MATMSG');
    resultMail.remove('TO');
    

    _launchSMS() async {
      final url =
          ('sms:' + resultsplit[1] + '?body=' + resultsplit[2].toString());
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchURL() async {
      final url = Get.arguments.code.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

     _launchMail() async {
      final url = 'mailto:'+resultMail[0]+'?subject=<Subject>&body=';
      ////"mailto:abhi@androidcoding.in?subject=Hi&body=How are you%20plugin")
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchBarcode() async {
      final url =
          'https://www.google.com/search?q=' + Get.arguments.code.toString();
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

    return Scaffold(
      body: Container(
        color: mainColor,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white,
            child: SingleChildScrollView(
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
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: Text('${Get.arguments.code}',
                                  style: mainTextStyle.copyWith(
                                      fontSize: 14, color: Colors.black)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  child: Text('${Get.arguments.code}',
                                      style: mainTextStyle.copyWith(
                                          fontSize: 14, color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
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
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 24),
                                      child: Text('${Get.arguments.code}',
                                          style: mainTextStyle.copyWith(
                                              fontSize: 14,
                                              color: Colors.black)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
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
                                                  backgroundColor: Colors.white,
                                                  content: Text(
                                                    'SMS copied to clipboard',
                                                    style: mainTextStyle
                                                        .copyWith(fontSize: 16),
                                                    textAlign: TextAlign.center,
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
                                                style: TextStyle(fontSize: 16)))
                                      ],
                                    ),
                                  ],
                                )
                              : ((Get.arguments.code)
                                      .toLowerCase()
                                      .contains('vcard'))
                                  ? Column(
                                      children: [
                                        Text(
                                          'QR Code - Contact',
                                          style: mainTextStyle,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text('${Get.arguments.code}',
                                              style: mainTextStyle.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Clipboard.setData(
                                                      new ClipboardData(
                                                          text:
                                                              '${Get.arguments.code}'));
                                                  final snackBar = SnackBar(
                                                      duration:
                                                          Duration(seconds: 2),
                                                      backgroundColor:
                                                          Colors.white,
                                                      content: Text(
                                                        'VCARD copied to clipboard',
                                                        style: mainTextStyle
                                                            .copyWith(
                                                                fontSize: 16),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                                child: Text('Copy VCARD',
                                                    style: TextStyle(
                                                        fontSize: 16))),
                                          ],
                                        ),
                                      ],
                                    )
                                  : ((describeEnum(Get.arguments.format))
                                          .toLowerCase()
                                          .contains('ean13'))
                                      ? Column(
                                          children: [
                                            Text(
                                              'Barcode - Item',
                                              style: mainTextStyle,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('${Get.arguments.code}',
                                                style: mainTextStyle.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Clipboard.setData(
                                                          new ClipboardData(
                                                              text:
                                                                  '${Get.arguments.code}'));
                                                      final snackBar = SnackBar(
                                                          duration: Duration(
                                                              seconds: 2),
                                                          backgroundColor:
                                                              Colors.white,
                                                          content: Text(
                                                            'Barcode copied to clipboard',
                                                            style: mainTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        16),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    child: Text('Copy Barcode',
                                                        style: TextStyle(
                                                            fontSize: 16))),
                                                ElevatedButton(
                                                    onPressed: _launchBarcode,
                                                    child: Text(
                                                        'Search on internet',
                                                        style: TextStyle(
                                                            fontSize: 16)))
                                              ],
                                            ),
                                          ],
                                        )
                                      : ((Get.arguments.code)
                                              .toLowerCase()
                                              .contains('wifi'))
                                          ? Column(
                                              children: [
                                                Text(
                                                  'QR Code - WIFI',
                                                  style: mainTextStyle,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  children: resultWifi
                                                      .map((e) => Text(e,
                                                          style: mainTextStyle
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black)))
                                                      .toList(),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Clipboard.setData(
                                                              new ClipboardData(
                                                                  text:
                                                                      '${Get.arguments.code}'));
                                                          final snackBar =
                                                              SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  content: Text(
                                                                    'Wifi copied to clipboard',
                                                                    style: mainTextStyle.copyWith(
                                                                        fontSize:
                                                                            16),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        },
                                                        child: Text('Copy Wifi',
                                                            style: TextStyle(
                                                                fontSize: 16))),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : ((Get.arguments.code)
                                                  .toLowerCase()
                                                  .contains('msg'))
                                              ? Column(
                                                  children: [
                                                    Text(
                                                      'QR Code - eMail',
                                                      style: mainTextStyle,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 24),
                                                      child: Text(
                                                          '${Get.arguments.code}',
                                                          style: mainTextStyle
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black)),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              Clipboard.setData(
                                                                  new ClipboardData(
                                                                      text:
                                                                          '${Get.arguments.code}'));
                                                              final snackBar =
                                                                  SnackBar(
                                                                      duration: Duration(
                                                                          seconds:
                                                                              2),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      content:
                                                                          Text(
                                                                        'Email copied to clipboard',
                                                                        style: mainTextStyle.copyWith(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ));
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            },
                                                            child: Text(
                                                                'Copy Email',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16))),
                                                        ElevatedButton(
                                                            onPressed:
                                                                _launchMail,
                                                            child: Text(
                                                                'Send Email',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16)))
                                                                        
                                                      ],
                                                    ),
                                                  ],
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
                                                      ? Column(
                                                          children: [
                                                            Text(
                                                              'QR Code - Event',
                                                              style:
                                                                  mainTextStyle,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          24),
                                                              child: Text(
                                                                  '${Get.arguments.code}',
                                                                  style: mainTextStyle.copyWith(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black)),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Clipboard.setData(
                                                                          new ClipboardData(
                                                                              text: '${Get.arguments.code}'));
                                                                      final snackBar = SnackBar(
                                                                          duration: Duration(seconds: 2),
                                                                          backgroundColor: Colors.white,
                                                                          content: Text(
                                                                            'Event copied to clipboard',
                                                                            style:
                                                                                mainTextStyle.copyWith(fontSize: 16),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ));
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                    },
                                                                    child: Text(
                                                                        'Copy Event',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16))),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : Text(
                                                          'Text',
                                                          style: mainTextStyle,
                                                        ),
                  Text('${describeEnum(Get.arguments.format)}'),
                  Column(children: resultMail.map((e) => Text(e)).toList(),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
