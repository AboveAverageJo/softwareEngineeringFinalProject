//import 'dart:html';

import 'package:flutter/material.dart';
import 'num_of_cups.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool french = false;
  bool drip = false;
  String data;

  void frenchFunc() {
    if (french == true) {
      french = false;

      data = "g - medium ground coffee";
    } else {
      french = true;
      drip = false;
      data = "g - course ground coffee";
    }
  }

  void dripFunc() {
    if (drip == true) {
      drip = false;
      data = "g - course ground coffee";
    } else {
      drip = true;
      french = false;
      data = "g - medium ground coffee";
    }
  }

  @override
  Widget build(BuildContext context) {
    var pressed;
    if (french || drip) {
      {
        pressed = () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CupScreen(data)));
        };
      }
    }
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "What coffee maker are you using?",
              key: Key('deviceScreen'),
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4C748B)),
            ),
            SizedBox(
              height: 25,
            ),
            LimitedBox(
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff4C748B),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(children: <Widget>[
                    CheckboxListTile(
                      value: french,
                      onChanged: (value) {
                        setState(() {
                          frenchFunc();
                        });
                      },
                      activeColor: Color(0xffF3F3F3),
                      checkColor: Color(0xff4C748B),
                      key: Key('French'),
                      title: Text(
                        "French Press",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff4C748B)),
                      ),
                    ),
                    Divider(
                      color: Color(0xff4C748B),
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: drip,
                      onChanged: (value) {
                        setState(() {
                          dripFunc();
                        });
                      },
                      activeColor: Color(0xffF3F3F3),
                      checkColor: Color(0xff4C748B),
                      key: Key('Drip'),
                      title: Text("Drip Machine",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4C748B))),
                    ),
                  ])),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              height: 45,
              width: 280,
              child: FlatButton(
                key: Key('ContinueMachine'),
                color: Color(0xff4C748B),
                textColor: Color(0xffFFFFFF),
                disabledColor: Color(0xffE2E2E2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: pressed,
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
