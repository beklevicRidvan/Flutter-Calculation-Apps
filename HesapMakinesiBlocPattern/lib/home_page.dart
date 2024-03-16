import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  double result = 0;
  double currentNumber = 0;
  String operator = '';

  void onNumberPressed(String value) {
    setState(() {
      if (display == '0') {
        display = value;
      } else {
        display += value;
      }
      currentNumber = double.parse(display);
    });
  }

  void onOperatorPressed(String newOperator) {
    setState(() {
      if (operator.isNotEmpty) {
        // Eğer önceki bir operator varsa, önceki işlemi tamamla
        performOperation();
      }
      operator = newOperator;
      result = currentNumber;
      display = '0';
    });
  }

  void performOperation() {
    setState(() {
      switch (operator) {
        case '+':
          result += currentNumber;
          break;
        case '-':
          result -= currentNumber;
          break;
        case '*':
          result *= currentNumber;
          break;
        case '/':
          result /= currentNumber;
          break;
        default:
        // Default olarak bir işlem belirtilmemişse, işlemi eşittir tuşuna basıldığında gerçekleştir
          result = currentNumber;
      }
      display = result.toString();
      operator = '';
    });
  }

  void onEqualPressed() {
    performOperation();
  }

  void onClearPressed() {
    setState(() {
      display = '0';
      result = 0;
      currentNumber = 0;
      operator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              display,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNumberButton('7'),
              buildNumberButton('8'),
              buildNumberButton('9'),
              buildOperatorButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNumberButton('4'),
              buildNumberButton('5'),
              buildNumberButton('6'),
              buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNumberButton('1'),
              buildNumberButton('2'),
              buildNumberButton('3'),
              buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNumberButton('0'),
              buildOperatorButton('='),
              buildOperatorButton('+'),
              buildClearButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNumberButton(String value) {
    return ElevatedButton(
      onPressed: () => onNumberPressed(value),
      child: Text(value),
    );
  }

  Widget buildOperatorButton(String value) {
    return ElevatedButton(
      onPressed: () {
        if (value == '=') {
          onEqualPressed();
        } else {
          onOperatorPressed(value);
        }
      },
      child: Text(value),
    );
  }

  Widget buildClearButton() {
    return ElevatedButton(
      onPressed: onClearPressed,
      child: Text('C'),
    );
  }
}
