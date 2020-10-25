import 'package:flutter/material.dart';
import 'package:registration/activity.dart';
import 'package:registration/test_bench.dart';

void main() {
  runApp(
    TestBench(
      child: Activity(
        title: "Demo",
        body: Text("Hello, World!!"),
      ),
    ),
  );
}
