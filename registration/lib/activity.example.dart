import 'package:flutter/material.dart';
import 'package:registration/activity.dart';

import 'test_bench.dart';

void main() {
  runApp(
    TestBench(
      child: Activity(
        title: "Demo",
        body: Text("Hello, World!"),
      ),
    ),
  );
}
