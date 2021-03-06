
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'auth.dart';

class RootPage extends StatefulWidget{
  RootPage({this.auth});
  final BaseAuth auth;
  @override 
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus{	// create empty status
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage>{

  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        //authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;        
      });
    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  @override 
  Widget build(BuildContext context){
    switch (authStatus){
      case AuthStatus.notSignedIn:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return new Scaffold(
          body: new Container(
            child: new Text('welcome'),
          )
        );
    }
  }
}