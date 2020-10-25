import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
        Container(
          padding: EdgeInsets.fromLTRB(100, 30, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                Padding(
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
                              Icons.menu_book,
                              size: 100,
                            ),
                            SizedBox(height: 15,),
                            Text("Register patient"),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => print("TODO: Open 'Register patient' screen."),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: Ink(
                    color: Colors.grey,
                    width: 200.0,
                    height: 100.0,
                    child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Text('Process payment'),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
