import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double result = 0;
  int clear = 0;
  double parseInput(String input) {
    return double.tryParse(input) ?? 0;
  }

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  void calculateResult(String operation) {
    double num1 = parseInput(num1Controller.text);
    double num2 = parseInput(num2Controller.text);

    setState(() {
      if (operation == '+') {
        result = num1 + num2;
      } else if (operation == '-') {
        result = num1 - num2;
      } else if (operation == '*') {
        result = num1 * num2;
      } else if (operation == '/') {
        if (num2 == 0) {
          result - double.nan;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("cannot divided by zeroooo"),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          num1 / num2;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator App',
          style: TextStyle(
              color: Colors.teal, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: num1Controller,
                      decoration: InputDecoration(
                        labelText: 'Num1',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 5),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: num2Controller,
                      decoration: InputDecoration(
                        labelText: 'Num2',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 5),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 20,
                color: const Color(0xff004F3F),
              ),
              Text('Result =$result'),
              Container(
                width: 40,
                height: 20,
                color: const Color(0xff004F3F),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        calculateResult('+');
                      },
                      child: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        calculateResult('-');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent),
                      child: const Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        calculateResult('*');
                      },
                      child: const Text(
                        'X',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        calculateResult('/');
                      },
                      child: Text(
                        '/',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
