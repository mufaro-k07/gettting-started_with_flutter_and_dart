import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
                  Text ("\$23.89",
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: 'Bill Amount',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print("Value: $value");
                    },
                  ),
                  // Split Bill Area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split',
                      style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          IconButton(
                            color:theme.colorScheme.primary,
                            onPressed: () => {}, icon: const Icon(Icons.remove)),
                          Text("3",
                          style: theme.textTheme.titleMedium,),
                          IconButton(
                            color:theme.colorScheme.primary,
                            onPressed: () => {}, icon: const Icon(Icons.add)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

