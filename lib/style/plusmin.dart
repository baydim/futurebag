import 'package:flutter/material.dart';
import 'package:futurebag/style/widgtall.dart';

Widget plusmin({IconData icon}) {
  return Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: oren,
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}
