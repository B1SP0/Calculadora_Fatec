import 'package:calculadora/views/memory.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'memory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.deepOrange),
            onPressed: () {
              Share.share('check out my website https://example.com/%27');
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          Divider(height: 0.1),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildLogicDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontFamily: 'TrueType', color: Colors.white70, fontSize: 30),
        ),
      ),
    );
  }

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontFamily: 'TrueType', color: Colors.white, fontSize: 52),
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label,
      {int flex = 1,
      Color textColor = Colors.white,
      Color backgroundColor = Colors.black}) {
    return Expanded(
      flex: flex,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: backgroundColor,
        textColor: textColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {
          setState(() {
            _memory.applyCommand(label);
          });
        },
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.black,
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', textColor: Colors.deepOrange),
                _buildKeyboardButton('DEL', textColor: Colors.deepOrange),
                _buildKeyboardButton('%', textColor: Colors.deepOrange),
                _buildKeyboardButton('÷', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('+', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('-', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0', flex: 2),
                _buildKeyboardButton('.'),
                _buildKeyboardButton('=', textColor: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
