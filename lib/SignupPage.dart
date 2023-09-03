import 'dart:convert';
import 'package:deliverayapp/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MainPage.dart';



class SignUp extends StatefulWidget {


  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {


  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  bool _IsNotValid = false;
  String variable = 'User';


    void RegisterUser() async {
    if (FirstNameController.text.isNotEmpty &&
        PasswordController.text.isNotEmpty &&
        LastNameController.text.isNotEmpty &&
        EmailController.text.isNotEmpty) {
      var headers = {

        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST', Uri.parse('http://localhost:3000/auth/signup'));
      request.body = json.encode({
        "name": FirstNameController.text,
        "userName": EmailController.text,
        "password": PasswordController.text,
        "type": variable.toString(),
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print('hello');
        print(await response.stream.bytesToString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }
      else {
        print('user invalid');
        print(response.reasonPhrase);
      }
    }
    else{
      setState(() {
        _IsNotValid=true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          title: Text(''),


          backgroundColor: (variable == 'Company')
              ? Colors.orange
              : (variable == 'User') ? Colors.blue : (variable ==
              'DeliveryGuy') ? Colors.green : Colors.blue,


        ),

        body: Center(


            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text('SIGN UP', style: TextStyle(
                      fontSize: 35,
                      fontWeight:
                      FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                    ),
                  ),
                  Text('JOIN AS...?', style: TextStyle(
                    fontSize: 20, fontWeight:
                  FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),),
                  SizedBox(height: 10,),


                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  variable = 'Company'
                                  ;
                                });


                                print(variable);
                              },


                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                children: <Widget>[
                                  Icon(Icons.shop),
                                  // <-- Icon
                                  Text("Company",
                                    style: TextStyle(fontSize: 10,
                                        fontWeight: FontWeight.bold),),
                                  // <-- Text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.blue,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  variable = 'User';
                                });

                                print(variable);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                children: <Widget>[
                                  Icon(Icons.person),
                                  // <-- Icon
                                  Text("User", style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),),
                                  // <-- Text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.green,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  variable = 'DeliveryGuy';
                                });

                                print(variable);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                children: <Widget>[
                                  Icon(Icons.delivery_dining),
                                  // <-- Icon
                                  Text("Delivery", style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),),
                                  // <-- Text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 10,),

                  Form(

                      child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14, 0, 0, 0),
                                  child: Text('First Name',
                                    style: TextStyle(fontSize: 15),),
                                ),
                              ],
                            ),

                            TextFormField(
                              controller: FirstNameController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: 'Type your first name',
                                prefixIcon: Icon(
                                    Icons.drive_file_rename_outline),
                                border: UnderlineInputBorder(),
                                errorText: _IsNotValid
                                    ? 'Please Enter your First Name'
                                    : null,
                              ),


                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14, 0, 0, 0),
                                  child: Text('Last Name',
                                    style: TextStyle(fontSize: 15),),
                                ),
                              ],
                            ),

                            TextFormField(
                              controller: LastNameController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(

                                hintText: 'Type your last name',
                                prefixIcon: Icon(
                                    Icons.drive_file_rename_outline),
                                border: UnderlineInputBorder(),
                                errorText: _IsNotValid
                                    ? 'Please Enter your Last Name'
                                    : null,
                              ),

                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14, 0, 0, 0),
                                  child: Text('Email',
                                    style: TextStyle(fontSize: 15),),
                                ),
                              ],
                            ),

                            TextFormField(
                              controller: EmailController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(

                                hintText: 'Type your Email',
                                prefixIcon: Icon(Icons.email),
                                border: UnderlineInputBorder(),
                                errorText: _IsNotValid
                                    ? 'Please Enter a valid Email'
                                    : null,
                              ),

                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14, 0, 0, 0),
                                  child: Text('Password',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),

                            TextFormField(
                              controller: PasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(

                                hintText: 'Type your Password',
                                prefixIcon: Icon(Icons.lock),
                                border: UnderlineInputBorder(),
                                errorText: _IsNotValid
                                    ? 'Please Enter a valid Password'
                                    : null,

                              ),

                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already a member?',
                                  style: TextStyle(
                                      color: Colors.grey[600]),),

                                TextButton(onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (
                                        context) => const LoginPage()),
                                  );
                                },
                                  child: Text('Log In', style: TextStyle(
                                      fontSize: 17,
                                      color: (variable == 'Company')
                                          ? Colors.orange
                                          : (variable == 'User') ? Colors
                                          .blue : (variable ==
                                          'DeliveryGuy')
                                          ? Colors.green
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold),),

                                )
                              ],


                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),

                              child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {
                                  setState(() {
                                    RegisterUser();
                                  });



                                },
                                child: Text('Sign Up'),
                                color: (variable == 'Company') ? Colors
                                    .orange : (variable == 'User')
                                    ? Colors.blue
                                    : (variable == 'DeliveryGuy') ? Colors
                                    .green : Colors.blue,
                                textColor: Colors.white,
                              ),


                            )
                          ]
                      )
                  )
                ])
        )
    );
  }
}

