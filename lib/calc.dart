import 'package:flutter/material.dart';

class Calc extends StatelessWidget {
  static String routeName = '/bmi';
  @override
  Widget build(BuildContext context) {
    final bmiValue = ModalRoute.of(context).settings.arguments as double;
    Map status() {
      if (bmiValue < 18.5) {
        return {
          'type': "Under Weight",
          'des': "You have underweight under weight body weight"
        };
      }
      if (bmiValue < 25) {
        return {'type': "Normal", 'des': "You have  normal body weight"};
      }

      if (bmiValue < 30) {
        return {
          'type': "Over Weight",
          'des': "You have  over weight body weight"
        };
      }
      return {'type': "Obey", 'des': "You have  Obey body weight"};
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Expanded(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      status()['type'],
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      bmiValue.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      status()['des'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                  'Recalculate',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
