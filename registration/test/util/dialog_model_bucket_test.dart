import 'package:registration/ui/register_patient/register_patient_dialog/register_patient_dialog.dart';
import 'package:registration/util/form_value.dart';
import 'package:registration/util/singleton_bucket.dart';
import "package:test/test.dart";

void main() {
  test("Should register dialog model", () {
    var firstRetrieval = SingletonBucket.get(() => ExampleDialogModel());
    expect(firstRetrieval, isNotNull);
    firstRetrieval.selectedShoeSize.value = 42;
    var secondRetrieval = SingletonBucket.get(() => ExampleDialogModel());
    expect(secondRetrieval.selectedShoeSize.value, equals(42));
  });

  test("Should reset dialog model", () {
    var firstRetrieval = SingletonBucket.get(() => ExampleDialogModel());
    firstRetrieval.selectedShoeSize.value = 42;
    var secondRetrieval = SingletonBucket.get(() => ExampleDialogModel());
    expect(secondRetrieval.selectedShoeSize.value, isNotNull);

    SingletonBucket.reset<ExampleDialogModel>();

    var thirdRetrieval = SingletonBucket.get(() => ExampleDialogModel());
    expect(thirdRetrieval.selectedShoeSize.value, isNull);
  });
}

class ExampleDialogModel {
  final selectedShoeSize = FormValue<int>();

  ExampleDialogModel() {
    print("[INFO] Constructor called");
  }
}
