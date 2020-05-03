import 'package:flutter/material.dart';
import 'package:vpn/src/Constants.dart';
import 'package:vpn/src/intro/Carousel.dart';
import 'package:vpn/src/vpn/vpn_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Map<String, dynamic>> items = Constants.slides;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image(
                        height: 60,
                        width: 100,
                        image: AssetImage("assets/images/logo3.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Carousel(items: items),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: MaterialButton(
                minWidth: 180.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => VpnPage()))
                },
                child: Text('GET STARTED'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
