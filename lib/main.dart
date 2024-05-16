import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> numbers = List.generate(100, (int number) => number + 1);

  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  child: DropdownButton(
                      itemHeight: 90,
                      icon: const Icon(Icons.timer),
                      iconSize: 50,
                      alignment: Alignment.center,
                      menuMaxHeight: 400,
                      value: selectedItem,
                      hint: const Text(
                        "00",
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      items: [
                        for (var number in numbers)
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: number,
                            child: Text(
                              number.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )
                      ],
                      onChanged: (number) {
                        setState(() {
                          selectedItem = number;
                        });
                      }),
                ),
                // Text(
                //   "$selectedItem",
                //   style: const TextStyle(
                //     fontSize: 60,
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Future.delayed(Duration(seconds: 1));
                      // if (selectedItem != 0) {
                      //   selectedItem! -= 1;
                      // }
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
