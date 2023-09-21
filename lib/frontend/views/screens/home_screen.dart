import 'package:bmi_calculator_23/frontend/routes/app_router.dart';
import 'package:bmi_calculator_23/frontend/views/widgets/gender_dropdown_button.dart';
import 'package:bmi_calculator_23/frontend/views/widgets/numeric_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double heightSliderValue = 180;
  double weightSliderValue = 85;
  double bmi = 26.2;

  TextEditingController _numericController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.amber,
                Colors.orange,
              ],
              radius: 3,
            ),
          ),
        ),
        title: const Center(
          child: Text(
            'BMI-Calculator',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.settings.name);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 255, 214, 89),
              Colors.orange,
            ],
            radius: 1.5,
          ),
        ),
        //? Main Column
        child: Column(
          children: [
            //? Dropdown Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  child: CustomDropdownButton(
                    dropdownItems: ['Männlich', 'Weiblich', 'Divers'],
                    selectedItem: 'Männlich',
                    icon: Icons.person,
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: NumericTextField(
                      controller: _numericController,
                    ),
                  ),
                ),
              ],
            ),
            // Height Text
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${(heightSliderValue / 100).toStringAsFixed(2)}m',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            // Adjustable Human Image and Height Slider
            SizedBox(
              height: 260,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/images/human_standing_silhouette.png',
                        height: 260,
                        width: 100,
                        fit: BoxFit.fill,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Image.asset(
                        'assets/images/human_standing_silhouette.png',
                        height: 200,
                        width: 95,
                        fit: BoxFit.fill,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      Image.asset(
                        'assets/images/human_standing_silhouette.png',
                        height: (260 - (260.0 - heightSliderValue) * 0.7).clamp(50, 260),
                        width: (200 - (200.0 - weightSliderValue) * 0.9).clamp(20, 200),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                      ),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          thumbColor: Colors.orange.shade800,
                          activeColor: Colors.orange,
                          inactiveColor: Colors.orange.shade400,
                          value: heightSliderValue,
                          min: 50,
                          max: 260,
                          onChanged: (double value) {
                            setState(() {
                              heightSliderValue = value;
                              bmi = calculateBMI(heightSliderValue, weightSliderValue);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //? Row with weight as text and slider
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    weightSliderValue.toStringAsFixed(1).length == 4 ? '${(weightSliderValue).toStringAsFixed(1)} kg' : '${(weightSliderValue).toStringAsFixed(1)}kg',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Slider(
                    thumbColor: Colors.orange.shade800,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.orange.shade400,
                    value: weightSliderValue,
                    min: 20,
                    max: 200,
                    onChanged: (double value) {
                      setState(() {
                        weightSliderValue = value;
                        bmi = calculateBMI(heightSliderValue, weightSliderValue);
                      });
                    },
                  ),
                ),
              ],
            ),
            //? Beautiful Container with BMI Text always showing
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.orange,
                    width: 2,
                  ),
                  gradient: const RadialGradient(
                    colors: [
                      Colors.amber,
                      Colors.orange,
                    ],
                    radius: 2.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'BMI: ${bmi.toStringAsFixed(1)}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
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

double calculateBMI(double height, double weight) {
  return weight / ((height / 100) * (height / 100));
}
