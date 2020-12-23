import 'package:get_it/get_it.dart';
import 'package:registration/core/patient/patient_service.dart';
import 'package:registration/core/visit/visit_service.dart';

void createMockContext() {
  GetIt.I.registerSingleton<PatientService>(MockPatientService());
  GetIt.I.registerSingleton<VisitService>(MockVisitService());
}
