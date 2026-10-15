import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.style,
    required this.total,
    required this.theme,
  });

  final TextStyle style;
  final double total;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          // color: Theme.of(context).colorScheme.inversePrimary, this will use the color from the theme, but we want to use a specific color
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Text ("Total Per Person",
            style: style,
            // style: TextStyle(
            //   // fontSize: 34,
            //   // style: Theme.of(context).textTheme.displayLarge, this will use the text style from the theme, but we want to use a specific style
            // ),
            ),
            Text ("\$${total.toStringAsFixed(2)}",
            style: style.copyWith(
              color: theme.colorScheme.onPrimary,
              fontSize: theme.textTheme.displaySmall?.fontSize
            ),
            ),
          ],
        )),
    );
  }
}

