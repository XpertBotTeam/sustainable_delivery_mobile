
import 'dart:convert';

import 'package:deliverayapp/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MainPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Password= TextEditingController();
  TextEditingController EmailAddress= TextEditingController();

 bool _IsNotValid= false;

  void LoginUser() async {
    if (Password.text.isNotEmpty ||
        EmailAddress.text.isNotEmpty ){



      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://localhost:3000/auth/login'));
      request.body = json.encode({
        "userName":EmailAddress.text,
        "password":Password.text,

      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('Signed Up');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }
      else {
       print('Check Email or Password ');
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


      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,50),
              child: Text('LOGIN',style: TextStyle(
              fontSize: 35,fontWeight:
              FontWeight.bold,decoration: TextDecoration.underline,
                color: Colors.black,
                letterSpacing: 2,
              ),
              ),
            ),


            Form(child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14,0,0,0),
                        child: Text('Email',style:TextStyle(fontSize: 15),),
                    ),
                  ],
                ),

                TextFormField(
                  controller: EmailAddress,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                    hintText: 'Type your Email',
                    prefixIcon: Icon(Icons.email),
                    border: UnderlineInputBorder(),
                    errorText: _IsNotValid ? 'Please Enter a valid Email' : null,
                  ),


                ),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14,0,0,0),
                      child: Text('Password',style:TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                TextFormField(
                  controller: Password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(

                    hintText: 'Type your password',
                    prefixIcon: Icon(Icons.lock),
                    border: UnderlineInputBorder(),

                    errorText: _IsNotValid ? 'Please Enter a valid Password' : null,
                  ),
                  onChanged: (String value) {
                  },
                  validator: (value){
                    return value !.isEmpty ? 'Please enter Password' : null;
                  },
                ),



              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(

                      onPressed: (){},
                      child:Text('Forgot password?',style: TextStyle(color: Colors.grey,),) ),
                ],
              ),
                SizedBox(height: 10
                  ,),

                Padding(
                  padding:EdgeInsets.fromLTRB(80  ,0,80,0),
                  child: MaterialButton( 
                  minWidth: double.infinity,
                  onPressed: (){
                    setState(() {
                      LoginUser();
                    });
                  },
                  child: Text('Login'),
                  color: Colors.black,
                  textColor: Colors.white,
                  ),
                ),
               TextButton(onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const SignUp()),
                 );
               }, child: Text('Or Sign Up Using',style: TextStyle(color: Colors.grey),)),
                Image.asset('images/aa.jpg'),

              ],

              

            ))

          ],
        ),
      ),

    );
  }
}
