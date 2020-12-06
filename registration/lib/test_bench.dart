import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class TestBench extends StatelessWidget {
  final Widget child;
  final bool isFullPage;
  final Size pageSize;

  TestBench({this.child, this.isFullPage = false, this.pageSize}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Bench',
      home: isFullPage ? child : wrapComponentInScaffold(),
      theme: ThemeData(fontFamily: "Roboto"),
    );
  }

  Scaffold wrapComponentInScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Bench'),
      ),
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
            maxHeight: 600,
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
