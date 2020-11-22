import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:registration/register_patient/register_patient_page.dart';
import 'package:registration/scaffold.dart';
import 'package:registration/test_bench.dart';

class RegistrationDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      title: "Dashboard",
      body: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.fromLTRB(100, 30, 0, 0),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              TileButton(icon: Icons.menu_book, title: "Register patient"),
              TileButton(icon: Icons.money, title: "Process payment"),
            ],
          ),
        ),
      ),
    );
  }
}

class TileButton extends StatelessWidget {
  final IconData icon;
  final String title;

  TileButton({@required this.icon, @required this.title})
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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPatientPage()));
        },
      ),
    );
  }
}

void main() {
  runApp(
    TestBench(
      child: RegistrationDashboard(),
    ),
  );
}
