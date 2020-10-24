import 'package:flutter/material.dart';
import 'package:registration/scaffold.dart';

import 'test_bench.dart';

void main() {
  runApp(
    TestBench(
      KschWorkflowsScaffold(
        body: Row(
          children: [
            const Text('Hello, Test Bench!'),
          ],
        ),
      ),
    ),
  );
}
