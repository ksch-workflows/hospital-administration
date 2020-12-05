
import 'package:flutter/material.dart';
import 'package:registration/register_patient/widgets/form_stepper.dart';


class RegisterPatientDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Register patient"),
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(800, 400)),
          child: FormStepper(
            steps: [
              _AddressForm(),
              _ContactForm(),
              _VisitTypeForm(),
            ],
          ),
        ),
      ],
    );
  }
}

class _AddressForm extends FormStep {
  _AddressForm() : super(title: "Personal data");

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _ContactForm extends FormStep {
  _ContactForm() : super(title: "Contact information");

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _VisitTypeForm extends FormStep {
  _VisitTypeForm() : super(title: "Visit type");

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}