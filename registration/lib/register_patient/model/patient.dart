import "package:uuid/uuid.dart";

class Patient {
  final String id;
  final String opdNumber;
  final String name;
  final String location;
  final DateTime lastVisit;

  Patient({
    this.id,
    this.opdNumber,
    this.name,
    this.location,
    this.lastVisit,
  });
}

final List<Patient> kAllPatients = [
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-1102",
    name: "John Doe",
    location: "Guesthouse",
    lastVisit: DateTime.now(),
  ),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2001",
      name: "Akrodhana Kalirai",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2002",
    name: "Balaja Sarup",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2003",
      name: "Abhidipa Raghunandan",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2004",
      name: "Padmavati Harku",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2005",
    name: "Budh Kalpak",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2006",
      name: "Sarala Mousumi",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2007",
    name: "Mathur Tanuja",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2008",
      name: "Jvalitri Mandhatri",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2009",
      name: "Karnikara Rachna",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2010",
      name: "Atmajyoti Vanita",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2011",
      name: "Jaibhusana Nirupa",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2012",
    name: "Jaisila Vikul",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2013",
    name: "Ravindra Kodanda",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2014",
    name: "Bhanu Sivakumar",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2015",
    name: "Bhrigu Srivathsan",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2016",
    name: "Atyantika Prudvi",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2017",
    name: "Janabalika Harku",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2018",
    name: "Javeed Sarath",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-2019",
    name: "Madhusudhana Varati",
    location: "Academy",
    lastVisit: DateTime.now(),
  ),
  Patient(
      id: Uuid().v4().toString(),
      opdNumber: "10-2020",
      name: "Kancanabha Nithin",
      location: "Academy",
      lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3002", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3003", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3004", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3005", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3006", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3007", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3009", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3010", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3011", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3012", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3013", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3014", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-3015", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
];
