import 'package:flutter/material.dart';
import 'package:healthy_weight/result_screen.dart';
import 'package:healthy_weight/weight_model.dart';

class HealthyWeightScreen extends StatefulWidget {
  const HealthyWeightScreen({Key? key}) : super(key: key);

  @override
  State<HealthyWeightScreen> createState() => _HealthyWeightScreenState();
}

class _HealthyWeightScreenState extends State<HealthyWeightScreen> {
  // double _heightOfUser = 40.0;

  double _transformedheight = 0;
  double lowest = 0, highest = 0;

  late WeightModel _weightModel;
  TextEditingController _heightOfUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/healthy.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Healthy Weight Calculator",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Height (cm)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  controller: _heightOfUser,
                ),
                // child: Slider(
                //   min: 40.0,
                //   max: 250.0,
                //   onChanged: (height) {
                //     setState(() {
                //       _heightOfUser = height;
                //     });
                //   },
                //   value: _heightOfUser,
                //   divisions: 100,
                //   activeColor: Colors.red,
                //   label: "$_heightOfUser",
                // ),
              ),
              // .5
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20))),
                onPressed: () {
                  setState(() {
                    _transformedheight = (double.parse(_heightOfUser.text) / (100));
                    lowest = (_transformedheight * _transformedheight) * 18.5;
                    highest = (_transformedheight * _transformedheight) * 24.9;

                    _weightModel = WeightModel(
                        weightUpper: highest,
                        weightLower: lowest,
                        comment: 'Your healthy weight range should be : ');
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                weightModel: _weightModel,
                              )));
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              // Text(
              //     '${lowest.toStringAsFixed(2)} to ${highest.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
