import 'package:deliverayapp/MainPage.dart';
import 'package:deliverayapp/loginpage.dart';
import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {


  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // List<bool> isSelected =[
  //   false,
  //   false,
  //   false,
  // ];






  @override
  Widget build(BuildContext context) {

    return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
    title: Text(' ',)
      ,
      backgroundColor: Colors.orange[500],
    ),
    body:Center(

    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,20),
        child: Text('SIGN UP',style: TextStyle(
          fontSize: 35,fontWeight:
        FontWeight.bold,decoration: TextDecoration.underline,
          color: Colors.black,
          letterSpacing: 2,
        ),
        ),
      ),
      Text('JOIN AS...?',style: TextStyle(
        fontSize: 20,fontWeight:
      FontWeight.bold,
        color: Colors.black,
        letterSpacing: 2,
      ),),
      SizedBox(height: 20,),
      
      // ToggleButtons(
      //
      //   children: [
      //     Icon(Icons.ice_skating_rounded),
      //     Icon(Icons.abc),
      //     Icon(Icons.wb_iridescent_rounded),
      //   ],
      //   onPressed: (int index){
      //     setState(() {
      //       isSelected[index] = !isSelected[index];
      //     });
      //   },
      //   isSelected: isSelected,
      // ),











      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox.fromSize(
            size: Size(56, 56),
            child: ClipOval(
              child: Material(
                color: Colors.orange,
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: (

                      ) { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );






                  },













                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Icon(Icons.shop),// <-- Icon
                      Text("Company",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),), // <-- Text
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
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.person),// <-- Icon
                      Text("User",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),), // <-- Text
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
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.delivery_dining), // <-- Icon
                      Text("Delivery",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),



    SizedBox(height: 20,),

    Form(child: Column(
    children: [Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14,0,0,0),
          child: Text('First Name',style:TextStyle(fontSize: 15),),
        ),
      ],
    ),

      TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          // labelText: 'Email',
          hintText: 'Type your first name',
          prefixIcon: Icon(Icons.drive_file_rename_outline),
          border: UnderlineInputBorder(),

        ),
        onChanged: (String value) {

        },
        validator: (value){
          return value !.isEmpty ? 'Please enter username' : null;
        },
    ),
      SizedBox(height: 10,),

      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14,0,0,0),
            child: Text('Last Name',style:TextStyle(fontSize: 15),),
          ),
        ],
      ),

      TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            // labelText: 'Email',
            hintText: 'Type your last name',
            prefixIcon: Icon(Icons.drive_file_rename_outline),
            border: UnderlineInputBorder(),

          ),
          onChanged: (String value) {

          },
          validator: (value){
            return value !.isEmpty ? 'Please enter last name ' : null;
          },
      ),
      SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14,0,0,0),
            child: Text('Email',style:TextStyle(fontSize: 15),),
          ),
        ],
      ),

      TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            // labelText: 'Email',
            hintText: 'Type your Email',
            prefixIcon: Icon(Icons.email),
            border: UnderlineInputBorder(),

          ),
          onChanged: (String value) {

          },
          validator: (value){
            return value !.isEmpty ? 'Please enter Email' : null;
          },
       ),
      SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14,0,0,0),
            child: Text('Password',style:TextStyle(fontSize: 15),
          ),
          ),],
      ),

      TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          // labelText: 'Email',
          hintText: 'Type your Password',
          prefixIcon: Icon(Icons.lock),
          border: UnderlineInputBorder(),

        ),
        onChanged: (String value) {

        },
        validator: (value){
          return value !.isEmpty ? 'Please enter Password' : null;
        },
      ),
      
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already a member?',style: TextStyle(color: Colors.grey[600]),),

          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );


          }, child: Text('Log In',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
      
          )],
      
      
      ),
      Padding(
        padding:EdgeInsets.fromLTRB(80  ,0,80,0),
        child: MaterialButton(
          minWidth: double.infinity,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );


          },
          child: Text('Sign Up'),
          color: Colors.orange,
          textColor: Colors.white,
        ),
      ),

      ]
        
    
    
    
    
    ),
      
      



    ),
    ]),
    ));
  }

}


