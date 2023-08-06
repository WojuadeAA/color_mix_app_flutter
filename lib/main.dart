import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool redSwitchEnabled = false;
  bool blueSwitchEnabled = false;
  bool greenSwitchEnabled = false;
  double redSliderValue = 0;
  double blueSliderValue = 0;
  double greenSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        sliderTheme: const SliderThemeData(
          inactiveTrackColor: Colors.grey,
        ),
        // switchTheme: SwitchThemeData(
        //   trackColor: MaterialStateColor.resolveWith((states) {
        //     if (states.contains(MaterialState.selected)) {
        //       return Colors.red;
        //     }
        //     return Colors.grey;
        //   }),
        // ),
      ),
      home: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 250,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 5),
                    color: Color.fromRGBO(
                        redSwitchEnabled ? (redSliderValue * 255).toInt() : 0,
                        greenSwitchEnabled
                            ? (greenSliderValue * 255).toInt()
                            : 0,
                        blueSwitchEnabled ? (blueSliderValue * 255).toInt() : 0,
                        1)),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  CupertinoSwitch(
                    value: redSwitchEnabled,
                    onChanged: (value) {
                      setState(() {
                        redSwitchEnabled = value;
                      });
                    },
                    activeColor: Colors.red,
                    thumbColor: Colors.red,
                    trackColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 50),
                  ColorMixerSlider(
                      color: Colors.red,
                      isEnabled: redSwitchEnabled,
                      onChanged: (value) {
                        setState(() {
                          redSliderValue = value;
                        });
                      },
                      sliderValue: redSliderValue),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CupertinoSwitch(
                    value: greenSwitchEnabled,
                    onChanged: (value) {
                      setState(() {
                        greenSwitchEnabled = value;
                      });
                    },
                    activeColor: Colors.green,
                    thumbColor: Colors.green,
                    trackColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 50),
                  ColorMixerSlider(
                    color: Colors.green,
                    isEnabled: greenSwitchEnabled,
                    onChanged: (value) {
                      setState(() {
                        greenSliderValue = value;
                      });
                    },
                    sliderValue: greenSliderValue,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CupertinoSwitch(
                    value: blueSwitchEnabled,
                    onChanged: (value) {
                      setState(() {
                        blueSwitchEnabled = value;
                      });
                    },
                    activeColor: Colors.blue,
                    thumbColor: Colors.blue,
                    trackColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 50),
                  ColorMixerSlider(
                    color: Colors.blue,
                    isEnabled: blueSwitchEnabled,
                    onChanged: (value) {
                      setState(() {
                        blueSliderValue = value;
                      });
                    },
                    sliderValue: blueSliderValue,
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class ColorMixerSlider extends StatelessWidget {
  const ColorMixerSlider(
      {super.key,
      required this.color,
      required this.isEnabled,
      required this.onChanged,
      required this.sliderValue});
  final bool isEnabled;
  final Function(double)? onChanged;
  final Color color;
  final double sliderValue;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: AbsorbPointer(
        absorbing: isEnabled ? false : true,
        child: Slider(
            value: sliderValue,
            onChanged: onChanged,
            inactiveColor: Colors.grey[300],
            thumbColor: color,
            activeColor: color),
      ),
    );
  }
}
