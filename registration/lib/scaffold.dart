import 'package:flutter/material.dart';
import 'package:registration/ui/dashboard/dashboard.dart';
import 'package:registration/routing.dart';
import 'package:registration/test_bench.dart';

class WebScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget floatingActionButton;
  final Function onNavigateBack;

  WebScaffold({
    @required this.title,
    @required this.body,
    this.onNavigateBack,
    this.floatingActionButton,
  })  : assert(title != null),
        assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          child: Column(
            children: [
              _AppBar(
                title: title,
                onNavigateBack: onNavigateBack,
              ),
              SizedBox(
                height: 50,
              ),
              _buildBodyWrapper(constraints)
            ],
          ),
        );
      }),
    );
  }

  Row _buildBodyWrapper(BoxConstraints constraints) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          child: floatingActionButton,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight - 145,
            maxWidth: constraints.maxWidth - 200,
          ),
          child: body,
        ),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  final String title;
  final Function onNavigateBack;

  _AppBar({
    @required this.title,
    this.onNavigateBack,
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final appBarColor = Theme.of(context).primaryColor;
    final buttonColor = Theme.of(context).buttonColor;

    return Container(
      color: appBarColor,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navigationWidgets(context, buttonColor),
          _actionButtons(buttonColor),
        ],
      ),
    );
  }

  IconButton _homeButton(BuildContext context, Color color) {
    return IconButton(
      icon: Icon(Icons.home, color: color),
      onPressed: () => Navigator.push(context, WebPageRoute(builder: (context) => RegistrationDashboard())),
    );
  }

  Row _navigationWidgets(BuildContext context, Color buttonColor) {
    return Row(
      children: [
        _homeButton(context, buttonColor),
        _backButton(buttonColor),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              //fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        )
      ],
    );
  }

  Row _actionButtons(Color color) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: color,
          ),
          onPressed: () => print("TODO: Open settings dialog"),
        ),
        IconButton(
          icon: Icon(
            Icons.logout,
            color: color,
          ),
          onPressed: () => print("TODO: Trigger logout"),
        ),
      ],
    );
  }

  Widget _backButton(Color buttonColor) {
    if (onNavigateBack != null) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        color: buttonColor,
        onPressed: onNavigateBack,
      );
    } else {
      return SizedBox(
        width: 40,
      );
    }
  }
}

void main() {
  runApp(
    TestBench(
      child: WebScaffold(
        body: Row(
          children: [
            const Text('Hello, Test Bench!'),
          ],
        ),
      ),
    ),
  );
}
