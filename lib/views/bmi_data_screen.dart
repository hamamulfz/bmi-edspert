import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBmi() {
  //   double heightInMeter = height / 100;

  //   // final h = pow(height, 2);
  //   final h = (heightInMeter * heightInMeter);
  //   final bmi = weight / h;

  //   return bmi;
  // }

  List<Widget> generateList(start, end) {
    List<Widget> weigths = [];
    for (var i = start; i < end; i++) {
      weigths.add(
        Text(
          "$i",
          style: labelTextStyle!.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weigths;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // print(calculateBmi());
          final bmiCalculator = BmiCalculator(height: height, weight: weight);
          print(height);
          print(weight);
          bmiCalculator.calculateBmi();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 80,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xffEC3C66),
              borderRadius: BorderRadius.circular(8)),
          child: const Center(
            child: Text(
              "Hitung BMI",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              
              Container(
                child: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
              
                      setState(() {});
              
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "male") ? Colors.white : primaryColor,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 15.0),
                              child:  GenderIconText(
                                icon: Icons.male,
                                title: 'Male',
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "male")
                                  ? Colors.white
                                  : primaryColor,
                            ),
                          )
                        ])
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "female") ? Colors.white : primaryColor,
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: const GenderIconText(
                              icon: Icons.female,
                              title: 'Female',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Icon(
                            Icons.check_circle,
                            color: (gender == "female")
                                ? Colors.white
                                : primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Text(
                "HEIGHT",
                style: labelTextStyle!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      child: Slider(
                        value: height.toDouble(),
                        min: 80,
                        max: 200,
                        thumbColor: Colors.red,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          height = value.toInt();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  BmiCard(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$height",
                            style: labelTextStyle,
                          ),
                          Text(
                            "cm",
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  age = val + 20;
                                  setState(() {});
                                },
                                children: generateList(20, 220),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController:
                                    FixedExtentScrollController(initialItem: 5),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  weight = val + 15;
                                  setState(() {});
                                },
                                children: generateList(15, 220),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff272A4E),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
