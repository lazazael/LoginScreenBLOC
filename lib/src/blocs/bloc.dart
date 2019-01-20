import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassw => _passwordController.sink.add;

  //retreive data from stream
  Stream<String> get streamEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get streamPassw => _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

//single global instance of bloc
final bloc = Bloc();

// be able to use *scoped instances of bloc* z for multiple instances in the same app
