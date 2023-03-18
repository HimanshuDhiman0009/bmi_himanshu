import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'package:bmi/screens/input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.interpritaion,
      required this.resultText});
  final String? bmiResult;
  final String? resultText;
  final String? interpritaion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ' Your Result',
              style: kNumberTextStyle,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: kInactiveCardColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toString(),
                      style: kTitileTextStyle,
                    ),
                    Text(
                      bmiResult.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      interpritaion.toString(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                bottomTitle: 'RE-CALCULATE'),
          ],
        ));
  }
}
