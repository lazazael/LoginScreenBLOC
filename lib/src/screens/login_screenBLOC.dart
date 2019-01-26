import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

// here the loginscreen widget is stateless because the BLOC keeps the state not the widget itself

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          fieldEmail(bloc),
          Container(margin: EdgeInsets.only(top: 30.0)),
          fieldPassw(bloc),
          Container(margin: EdgeInsets.only(top: 30.0)),
          buttonSubmit(bloc),
        ],
      ),
    );
  }

  Widget fieldEmail(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.streamEmail,
      builder: (context, snapshot) {
        return TextField(
/*           onChanged: (newValue){
            bloc.changeEmail(newValue);
          }, */
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you at example dot domain',
            labelText: 'Email address',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget fieldPassw(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.streamPassw,
        builder: (context, snapshot) {
          return TextField(
              onChanged: bloc.changePassw,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'password must contain at least 4 charz',
                labelText: 'Passwordz',
                errorText: snapshot.error,
              ));
        });
  }

  Widget buttonSubmit(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.lightGreen,
          //to disable to button call it with null
          //onPressed: () {},
          onPressed: snapshot.hasData ? bloc.submit : null,
/*               ? () {
                  print('hi');
                }
              : null, */
        );
      },
    );
  }
}
