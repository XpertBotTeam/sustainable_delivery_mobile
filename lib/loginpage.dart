
import 'package:deliverayapp/SignupPage.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // appBar: AppBar(
      //   title: Text('',),
      //   elevation: 0,
      //
      // ),
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
                      child: Text('Username',style:TextStyle(fontSize: 15),),
                    ),
                  ],
                ),

                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    // labelText: 'Email',
                    hintText: 'Type your username',
                    prefixIcon: Icon(Icons.email),
                    border: UnderlineInputBorder(),

                  ),
                  onChanged: (String value) {

                },
                  validator: (value){
                    return value !.isEmpty ? 'Please enter username' : null;
                  },

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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // labelText: 'Password',
                    hintText: 'Type your password',
                    prefixIcon: Icon(Icons.lock),
                    border: UnderlineInputBorder(),
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
                  onPressed: (){},
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
