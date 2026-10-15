import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() =>  UTipState();
}

class UTipState extends State<UTip> {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return ((_billTotal * _tipPercentage) + (_billTotal)) / _personCount;
  }

  double totalTip() {
    return (_billTotal * _tipPercentage);
  }

  // Methods 
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }
  void decrement() {
    if (_personCount > 1) {
      setState(() {
        _personCount--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    // Add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
        // leading will be used to add something at the top left of the app bar, like a back button or a menu icon
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
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
          ),
          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // width: 100,
              // height: 100,
              // removed the fixed height and width
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged:(value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                    },
                  ),
                  // Split Bill Area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split',
                      style: theme.textTheme.titleMedium,
                      ),
                      PersonCounter(theme: theme, personCount: _personCount,
                      onDecrement: decrement, onIncrement: increment),

                    ],
                  ),
                      // Tip Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tip',
                          style: theme.textTheme.titleMedium,),
                          Text("\$$totalT",
                          style: theme.textTheme.titleMedium,)
                        ],
                      ),

                      // Slider Text
                      Text('${(_tipPercentage * 100).round()}%'),

                      // Tip Slider
                      TipSlider(tipPercentage: _tipPercentage, onChanged: (double value) { 
                        setState(() {
                          _tipPercentage = value;
                        });
                       },)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


