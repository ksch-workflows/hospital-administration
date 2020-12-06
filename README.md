# Hospital Administration

[![CodeScene Code Health](https://codescene.io/projects/10126/status-badges/code-health)](https://codescene.io/projects/10126)

The purpose of this project is to support the administrative work in the [Kirpal Sagar Charitable Hospital](https://kirpal-sagar.org/en/kirpal-charitable-hospital-en/).

## Architecture

For details about the technical architecture, please refer the [arc42 documentation](https://docs.google.com/document/d/1We6tpOIF1H0ZE_XljF4qZZHYxsrTh5O_7rko7QVP41Y/edit?usp=sharing).

### Technologies

The project is getting build with the following technologies:

- [AsciiDoctor](https://github.com/ksch-workflows/hospital-administration/wiki/AsciiDoctor) - tool for documentation generation
- [Dart](https://github.com/ksch-workflows/hospital-administration/wiki/Dart) - programming language used for the frontend
- [Flutter](https://github.com/ksch-workflows/hospital-administration/wiki/Flutter) - framework for the development of mobile and web applications
- [Gradle](https://github.com/ksch-workflows/ksch-workflows/wiki/Gradle) - used for the compilation of the source code into an executable application  
- [IntelliJ IDEA](https://github.com/ksch-workflows/ksch-workflows/wiki/IntelliJ) - recommend text editor for Java and Dart code
- [Java](https://github.com/ksch-workflows/hospital-administration/wiki/Java) - programming language used for the backend
- [Spring](https://github.com/ksch-workflows/hospital-administration/wiki/Spring) - framework for the development of enterprise applications

## Contributing

If you would like to contribute and have any technical or organisational questions, please write an email to [ksch-workflows@googlegroups.com](mailto:ksch-workflows@googlegroups.com).

### Getting started

Follow the links [above](#technology) for installation hints for the respective technology.

## Maintenance

### Create new development release

```
cd registration 
flutter build web
cd ..
firebase deploy
```

## License

The "Hospital Administration" project is maintained by [KS-plus e.V.](https://ks-plus.org/en/welcome/), a non-profit association dedicated to supporting [Kirpal Sagar](https://kirpal-sagar.org/en/welcome/).

It is licensed under the [Apache License Version 2.0](https://github.com/ksch-workflows/ksch-workflows/blob/master/LICENSE).
