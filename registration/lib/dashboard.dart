import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RegistrationDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.fromLTRB(100, 30, 0, 0),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                OpenActivityTitle(icon: Icons.menu_book, title: "Register patient"),
                OpenActivityTitle(icon: Icons.money, title: "Process payment"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OpenActivityTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  OpenActivityTitle({@required this.icon, @required this.title})
      : assert(icon != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: InkWell(
        child: Ink(
          width: 200,
          height: 200,
          color: Colors.grey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 100,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(title),
              ],
            ),
          ),
        ),
        onTap: () => print("TODO: Open '$title' screen."),
      ),
    );
  }
}
