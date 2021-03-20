part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text('QR and Barcode Scan', style: mainTextStyle.copyWith(fontSize: 24,color: Colors.black),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text('Fast easy and free ',style: mainTextStyle.copyWith(fontSize: 16, color: Colors.black54)),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                  ),
                  onPressed: () {
                    Get.to(ScannerPage());
                  },
                  child: Text("Lets Get Started", style: mainTextStyle)
                  
                  ),
              
            ),
            

          ],
        ),
      ),
    );
  }
}
