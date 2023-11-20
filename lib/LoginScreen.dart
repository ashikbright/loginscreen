import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _userTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(75, 255, 87, 55),
                  Color.fromARGB(200, 248, 168, 21),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _userTextController,
                      key: const ValueKey("username"),
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        border: myinputborder(),
                        icon: Icon(Icons.person,color: Colors.black,),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordTextController,
                      key: const ValueKey("password"),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          border: myinputborder(),
                          icon: Icon(Icons.password,color: Colors.black,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          )
                      ),
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is empty';
                        }
                        if (value.length<8) {
                          return 'Password must be atleast 8 charaters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please Wait!!!')),
                            );
                          }
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Forgot Password'),
                            backgroundColor: Colors.orangeAccent,
                            content: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter your email address:',
                              ),
                              controller: _emailTextController,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Reset Password'),
                                onPressed: () {},
                              ),
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Forgot Password',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder myinputborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 3,
    ),
  );
}
