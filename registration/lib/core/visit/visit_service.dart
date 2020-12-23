import 'package:registration/core/visit/visit.dart';
import 'package:uuid/uuid.dart';

abstract class VisitService {
  Visit startVisit(String patientId);
}

class MockVisitService implements VisitService {
  @override
  Visit startVisit(String patientId) {
    return Visit(
      id: Uuid().v4(),
      patientId: patientId,
    );
  }
}
