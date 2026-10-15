
import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const new({
    super.key,
    required this.theme,
    required this._personCount,
    required this.onDecrement,
    required this.onIncrement,
  });

  final ThemeData theme;
  final int _personCount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color:theme.colorScheme.primary,
          onPressed: onDecrement, icon: const Icon(Icons.remove)),
        Text("$_personCount",
        style: theme.textTheme.titleMedium,),
        IconButton(
          color:theme.colorScheme.primary,
          onPressed: onIncrement, icon: const Icon(Icons.add)),
      ],
    );
  }
}

