import 'package:bmi_calculator/bottom_card.dart';
import 'package:bmi_calculator/calc.dart';
import 'package:flutter/material.dart';
import './gender_widget.dart';

const Color normalColor = Colors.black45;
const Color tapColor = Colors.lightBlueAccent;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BMICalculator(),
      routes: {
        Calc.routeName: (ctx) => Calc(),
      },
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Color maleColor = Colors.black45;
  Color femaleColor = Colors.black45;
  double height = 120;
  int age = 20;
  int weight = 50;

  void addData(String name, int data) {
    setState(() {
      if (name == "Age") {
        age += 1;
      } else {
        weight += 1;
      }
    });
  }

  void minusData(String name, int data) {
    setState(() {
      if (name == "Age") {
        age -= 1;
      } else {
        weight -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double bmiValue = weight / (height / 100);

    void changeColor(name) {
      setState(() {
        if (name == 'Male') {
          maleColor = Colors.blueAccent;
          femaleColor = Colors.black54;
        } else {
          femaleColor = Colors.blueAccent;
          maleColor = Colors.black54;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderWidget(
                    name: "Male",
                    icon: Icons.person,
                    normalColor: maleColor,
                    changeColor: changeColor,
                  ),
                ),
                Expanded(
                  child: GenderWidget(
                    normalColor: femaleColor,
                    name: "Female",
                    icon: Icons.pregnant_woman_rounded,
                    changeColor: changeColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: normalColor,
              cardData: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height : ${height.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                      min: 100,
                      max: 200,
                      value: height,
                      onChanged: (val) {
                        setState(() {
                          height = val;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BottomReusableCard(
                    name: "Age",
                    data: age,
                    addData: addData,
                    minusData: minusData,
                  ),
                ),
                Expanded(
                  child: BottomReusableCard(
                    name: "Weight",
                    data: weight,
                    addData: addData,
                    minusData: minusData,
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Calc.routeName, arguments: bmiValue);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final cardData;

  ReusableCard({this.color, this.cardData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardData,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }
}
