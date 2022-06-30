import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';

// ignore: must_be_immutable
class Recommend extends StatefulWidget {
  String value;
  String data;
  Recommend(this.data, {Key key, this.value}) : super(key: key);
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    int cups = int.parse(widget.value);
    double totalWater = CoffeeTools.water(cups);
    double frenchCoffee = CoffeeTools.french(cups);
    double dripCoffee = CoffeeTools.drip(cups);
    double coffee;

    if (widget.data == "g - course ground coffee") {
      coffee = frenchCoffee;
    } else if (widget.data == "g - medium ground coffee") {
      coffee = dripCoffee;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4C748B),
            ),
            key: Key('backButtonRec'),
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
                  Padding(
                    padding: EdgeInsets.all(90),
                  ),
                  LimitedBox(
                      child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff4C748B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(children: <Widget>[
                            Text("Recommended",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Kollektif",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4C748B),
                                )),
                            Divider(
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            SizedBox(height: 20),
                            Text("${coffee.round()}${widget.data}",
                                key: Key('Coffee'),
                                style: TextStyle(
                                  fontFamily: "Kollektif",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4C748B),
                                )),
                            Text("${totalWater.round()}g - water",
                                key: Key('Water'),
                                style: TextStyle(
                                  fontFamily: "Kollektif",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4C748B),
                                )),
                            SizedBox(height: 45),
                            Text(
                                "Enjoy your black coffe, should've got a reign tbh.",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4C748B),
                                )),
                          ]))),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                        SizedBox(
                            height: 45,
                            width: 280,
                            child: FlatButton(
                                key: Key('DoneR'),
                                child: Text("Done",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFFFFFF),
                                    )),
                                textColor: Color(0xffFFFFFF),
                                color: Color(0xff4C748B),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChooseDeviceScreen()));
                                })),
                      ]))
                ])));
  }
}
