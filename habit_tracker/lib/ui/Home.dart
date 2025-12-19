import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _timeString = '';

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          )
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 2,
            margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          ),
          Text(
            _timeString,
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            color: Colors.black,
            height: 2,
            margin: const EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}