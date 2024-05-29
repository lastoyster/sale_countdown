import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';


class SaleCountdownTimer extends StatefulWidget {
  final DateTime endTime; 
  final TextStyle? textStyle;

  const SaleCountdownTimer({required this.endTime, this.textStyle});

  @override
  _SaleCountdownTimerState createState() => _SaleCountdownTimerState();
}

class _SaleCountdownTimerState extends State<SaleCountdownTimer> {
  @override
  Widget build(BuildContext context) {
    int endTimeInMilliseconds = widget.endTime.millisecondsSinceEpoch;

    return CountdownTimer(
      endTime: endTimeInMilliseconds,
      textStyle: widget.textStyle ??
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      onEnd: () {
        // Handle what happens when the countdown ends
        setState(() {}); // To rebuild the widget and show a message
      },
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Text('Sale Ended!');
        }
        return Text(
          'Sale Ends In: ${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}m ${time.sec ?? 0}s',
        );
      },
    );
  }
}
