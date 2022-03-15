import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final weightModel;

  ResultScreen({required this.weightModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/images/healthy.png",
                fit: BoxFit.contain,
              ),
              // : Image.asset(
              //     "assets/images/heart2.png",
              //     fit: BoxFit.contain,
              //   ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "The healthy weight range for your height is ${weightModel.weightLower.toStringAsFixed(2)}kg to ${weightModel.weightUpper.toStringAsFixed(2)}kg",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 18))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CALCULATE AGAIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }
}
