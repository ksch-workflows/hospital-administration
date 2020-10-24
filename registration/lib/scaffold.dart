import 'package:flutter/material.dart';

class KschWorkflowsScaffold extends StatelessWidget {
  final Widget body;

  KschWorkflowsScaffold({@required this.body}) : assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_AppBar(), body],
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.home,
        ),
        Icon(
          Icons.settings,
        ),
        Icon(
          Icons.logout,
        ),
      ],
    );
  }
}
