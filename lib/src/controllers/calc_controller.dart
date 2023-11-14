import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/widgets/button_hub.dart';
import 'package:function_tree/function_tree.dart';

class CalcController extends ChangeNotifier {
  var display = '';

  void onButtonPressed(ButtonEvent value) {
    switch (value.runtimeType) {
      case CommonButtonEvent:
        display += value.value;
        break;
      case OperatorButtonEvent:
        display += value.value;
        break;
      case EqualsButtonEvent:
        try {
          display = _calculate(display);
        } catch (e) {
          display = '#ERROR';
        }
        break;
      case ClearButtonEvent:
        display = '';
        break;
      case ClearEntryButtonEvent:
        display = '';
        break;
      default:
        break;
    }

    // if initial text was 'error', clear it
    if (display == '#ERROR') {
      display = '';
    }
    // if there's no value, set it to 0
    if (display.isEmpty) {
      display = '0';
    }
    // if there's a leading zero, remove it
    if (display.startsWith('0') && display.length > 1) {
      display = display.substring(1);
    }
    // if there's a '.0' at the end, remove it
    if (display.endsWith('.0')) {
      display = display.substring(0, display.length - 2);
    }
    notifyListeners();
  }
}

String _calculate(String value) {
  final math = value.interpret();
  return math.toString();
}
