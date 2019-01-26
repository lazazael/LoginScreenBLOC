import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  //by default streams are single subscription
  //final _emailController = StreamController<String>();
  //final _passwordController = StreamController<String>();

  //rxdart StreamController with .latest, .value
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // change data on the stream, retreive data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassw => _passwordController.sink.add;

  //add data to the stream
  Stream<String> get streamEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get streamPassw => _passwordController.stream.transform(validatePassword);

  //rxdart function to retrieve 2 streams as one
  Stream<bool> get submitValid =>
      Observable.combineLatest2(streamEmail, streamPassw, (e, p) => true);

  submit() {
    final validEmail = _emailController.value;
    final validPassw = _passwordController.value;

    print('email is $validEmail');
    print('passw is $validPassw');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

//single global instance of bloc
//final bloc = Bloc();

// be able to use *scoped instances of bloc* z for multiple instances in the same app
