import 'package:flutter/material.dart';

sealed class ButtonEvent {
  final String value;

  const ButtonEvent(this.value);
}

class CommonButtonEvent extends ButtonEvent {
  const CommonButtonEvent(String value) : super(value);
}

class OperatorButtonEvent extends ButtonEvent {
  const OperatorButtonEvent(String value) : super(value);
}

class EqualsButtonEvent extends ButtonEvent {
  const EqualsButtonEvent() : super('=');
}

class ClearButtonEvent extends ButtonEvent {
  const ClearButtonEvent() : super('C');
}

class ClearEntryButtonEvent extends ButtonEvent {
  const ClearEntryButtonEvent() : super('CE');
}

// ignore: must_be_immutable
class ButtonHub extends StatelessWidget {
  final void Function(ButtonEvent)? onPressed;
  ButtonHub({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var buttons = [
      '%',
      'CE',
      'C',
      '÷',
      '7',
      '8',
      '9',
      'x',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '+/-',
      '0',
      '.',
      '=',
    ];
    var functions = {
      '%': () {
        onPressed?.call(const CommonButtonEvent('%'));
      },
      'CE': () {
        onPressed?.call(const ClearEntryButtonEvent());
      },
      'C': () {
        onPressed?.call(const ClearButtonEvent());
      },
      '÷': () {
        onPressed?.call(const OperatorButtonEvent('/'));
      },
      'x': () {
        onPressed?.call(const OperatorButtonEvent('*'));
      },
      '-': () {
        onPressed?.call(const OperatorButtonEvent('-'));
      },
      '+': () {
        onPressed?.call(const OperatorButtonEvent('+'));
      },
      '.': () {
        onPressed?.call(const CommonButtonEvent('.'));
      },
      '=': () {
        onPressed?.call(const EqualsButtonEvent());
      },
      '0': () {
        onPressed?.call(const CommonButtonEvent('0'));
      },
      '1': () {
        onPressed?.call(const CommonButtonEvent('1'));
      },
      '2': () {
        onPressed?.call(const CommonButtonEvent('2'));
      },
      '3': () {
        onPressed?.call(const CommonButtonEvent('3'));
      },
      '4': () {
        onPressed?.call(const CommonButtonEvent('4'));
      },
      '5': () {
        onPressed?.call(const CommonButtonEvent('5'));
      },
      '6': () {
        onPressed?.call(const CommonButtonEvent('6'));
      },
      '7': () {
        onPressed?.call(const CommonButtonEvent('7'));
      },
      '8': () {
        onPressed?.call(const CommonButtonEvent('8'));
      },
      '9': () {
        onPressed?.call(const CommonButtonEvent('9'));
      },
      '+/-': () {
        onPressed?.call(const OperatorButtonEvent('+/-'));
      },
    };

    var colors = {
      // use primary
      '÷': Theme.of(context).colorScheme.primary,
      'x': Theme.of(context).colorScheme.primary,
      '-': Theme.of(context).colorScheme.primary,
      '+': Theme.of(context).colorScheme.primary,
      '=': Theme.of(context).colorScheme.primary,
      // use secondary
      '%': Theme.of(context).colorScheme.secondary,
      'CE': Theme.of(context).colorScheme.secondary,
      'C': Theme.of(context).colorScheme.secondary,
      '+/-': Theme.of(context).colorScheme.secondary,
      '.': Theme.of(context).colorScheme.secondary,
    };

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(16),
      children: buttons
          .map((e) => Button(
              value: e,
              onPressed: functions[e],
              color: colors[e] ?? Colors.transparent))
          .toList(),
    );
  }
}

class Button extends StatelessWidget {
  final String value;
  final Color color;
  final VoidCallback? onPressed;
  const Button(
      {super.key, required this.value, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(24),
        shape: const CircleBorder(),
      ),
      onPressed: () => onPressed?.call(),
      child: Text(value),
    );
  }
}
