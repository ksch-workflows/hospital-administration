import 'package:flutter/material.dart';

class RegistrationDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        Ink(
          color: Colors.yellow,
          width: 200.0,
          height: 100.0,
          child: InkWell(
              onTap: () { },
              child: Center(
                child: Text('YELLOW'),
              )
          ),
        ),
      ],
    );
  }
}
