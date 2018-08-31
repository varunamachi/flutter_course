import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
  final _emailCtl = new StreamController<String>();

  final _passwordCtl = new StreamController<String>();

  Stream<String> get email => _emailCtl.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordCtl.stream.transform(validatePassword);

  Function(String) get setEmail => _emailCtl.sink.add;
  Function(String) get setPassword => _passwordCtl.sink.add;

  dispose() {
    _emailCtl.close();
    _passwordCtl.close();
  }

}

