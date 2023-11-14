import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/controllers/calc_controller.dart';
import 'package:flutter_calculator/src/widgets/button_hub.dart';
import 'package:flutter_calculator/src/widgets/display.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  final controller = CalcController();

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(flex: 1, child: Display(value: controller.display)),
          Expanded(
              flex: 3,
              child: ButtonHub(
                onPressed: controller.onButtonPressed,
              )),
        ],
      ),
    );
  }
}
