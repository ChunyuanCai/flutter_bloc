import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'validator.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  get changeEmail => _emailController.sink.add;

  get changePassword => _passwordController.sink.add;

  get email => _emailController.stream.transform(validateEmail);

  get password => _passwordController.stream.transform(validatePassword);

  get submitValid => Rx.combineLatest2(email, password, (e, p) => true);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
