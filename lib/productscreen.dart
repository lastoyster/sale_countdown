import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class SaleCountdownTimer extends StatefulWidget {
  final DateTime endTime;
  final TextStyle? textStyle;

  SaleCountdownTimer({required this.endTime, this.textStyle});

  @override
  _SaleCountdownTimerState createState() => _SaleCountdownTimerState();
}

class _SaleCountdownTimerState extends State<SaleCountdownTimer> {
  int? _endTimeInMilliseconds;

  @override
  void initState() {
    super.initState();
    _calculateEndTime(); // Calculate initially
  }

  void _calculateEndTime() {
    final now = DateTime.now();
    _endTimeInMilliseconds = widget.endTime.difference(now).inMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: _endTimeInMilliseconds, // Use the calculated value
      textStyle: widget.textStyle ??
         const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      onEnd: () {
        // This callback will only be called once when the timer ends
        setState(() {
          _endTimeInMilliseconds = null; // Clear the end time to prevent rebuilds
        });
      },
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Text('Sale Ended!');
        }
        return Text(
          'Sale Ends In: ${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}m ${time.sec ?? 0}s', // Template literals
        );
      },
    );
  }
}
