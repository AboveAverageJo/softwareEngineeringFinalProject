import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'recommended.dart';

class CupScreen extends StatefulWidget {
  final String data;
  CupScreen(this.data);
  @override
  _CupScreenState createState() => _CupScreenState();
}

class _CupScreenState extends State<CupScreen> {
  goToRecommendedScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Recommend(
                  widget.data,
                  value: controllerForNumOfCups.text,
                )));
  }

  @override
  var controllerForNumOfCups = TextEditingController();
  bool isPressed = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4C748B),
          ),
          key: Key('backButtonCups'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'How many cups would you like?',
              key: Key('cupScreen'),
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4C748B)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            LimitedBox(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff4C748B),
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    key: Key('Cups'),
                    decoration: InputDecoration.collapsed(hintText: ""),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: controllerForNumOfCups,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          isPressed = false;
                        });
                      }
                      var isDigitsOnly = int.tryParse(value);
                      if (isDigitsOnly > 0) {
                        setState(() {
                          isPressed = true;
                        });
                      }
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            SizedBox(
              height: 45,
              width: 280,
              child: FlatButton(
                key: Key('ContinueCups'),
                color: Color(0xff4C748B),
                textColor: Color(0xffFFFFFF),
                disabledColor: Color(0xffE2E2E2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: isPressed
                    ? () {
                        goToRecommendedScreen(context);
                      }
                    : null,
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
