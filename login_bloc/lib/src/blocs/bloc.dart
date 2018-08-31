import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _emailCtl = new BehaviorSubject<String>();
  final _passwordCtl = new BehaviorSubject<String>();
  Stream<String> get email => _emailCtl.stream.transform(validateEmail);
  Stream<String> get password => 
    _passwordCtl.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get setEmail => _emailCtl.sink.add;
  Function(String) get setPassword => _passwordCtl.sink.add;

  void dispose() {
    _emailCtl.close();
    _passwordCtl.close();
  }

  void submit() {
    var email = this._emailCtl.value;
    var pw = this._passwordCtl.value;

    print("Email: $email : $pw");
  }
}
