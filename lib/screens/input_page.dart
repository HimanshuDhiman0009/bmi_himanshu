import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../coponents/reusable_card.dart';
import '../coponents/icon_content.dart';
import '../constants.dart';
import '../coponents/results.dart';
import '../coponents/bottom_button.dart';
import 'package:bmi/calculation_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, lable: 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, lable: 'FEMALE'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabeTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kLabeTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
                colour: kInactiveCardColor),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabeTextStyle,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(Icons.remove),
                              onPressed: () {
                                setState(
                                  () {
                                    weight = weight - 1;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    colour: kInactiveCardColor),
              ),
              Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabeTextStyle,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(
                                    () {
                                      age = age - 1;
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      colour: kInactiveCardColor)),
            ],
          ),
          BottomButton(
              onTap: () {
                CalculationBrain calc =
                    CalculationBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpritaion: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
              bottomTitle: 'Calculate')
        ],
      ),
    );
  }
}

// TODO: make this code working in place of weight and age widget at bottom
// class RoundIconButton extends StatelessWidget {
//   RoundIconButton({required this.icon, required this.onPressed});
//   final IconData icon;
//   final Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return const RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(icon),
//       elevation: 6.0,
//       constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
//       shape: CircleBorder(),
//       fillColor: Color(0xFF4C4f5e),
//     );
//   }
// }
