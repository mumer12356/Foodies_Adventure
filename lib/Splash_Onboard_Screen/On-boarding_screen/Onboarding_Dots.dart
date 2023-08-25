

import 'dart:math';

import 'package:flutter/material.dart';




Widget buildDot(int activePageIndex) {
  int currentIndex=0;


  double selectedIndex=Curves.easeOut.transform(
      max(0.0, 1.0-((currentIndex)-activePageIndex).abs()));
  double zoom=1.0+ (1.6 - 1.3)*selectedIndex;
  return SizedBox(
    width: 20,
    child: Center(
      child: Material(
        color: const Color(0xFF5545aa),
        type: MaterialType.circle,
        child: SizedBox(
          width: 8.0*zoom,
          height: 20.0*zoom,
        ),
      ),
    ),
  );
}
