import 'package:flutter/material.dart';
import 'package:registration/scaffold.dart';

import 'test_bench.dart';

void main() {
  runApp(
    TestBench(
      child: PageFrame(
        body: Row(
          children: [
            const Text('Hello, Test Bench!'),
          ],
        ),
      ),
    ),
  );
}
