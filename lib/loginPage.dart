import 'package:flutter/material.dart';
import 'package:login/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userEmail;
  String? userPassword;
  String? password2;
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  //final passcontroller2 = TextEditingController();
 bool isObsecure=true;
  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(30),
        child: Form(
          key: mykey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 250,
                child: Image.asset("assets/pic/login.png",fit:BoxFit.cover),
              ),
             // const SizedBox(height: 10,),
              const Text("Welcome Back",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey),),
              const SizedBox(height: 20,),

              TextFormField(
                controller: userEmailController,
                textInputAction: TextInputAction.next,
                keyboardType:TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.email)), //icon inside box
                  // icon:(Icon(Icons.person)),//icon outside before box
                  hintText: "Enter your Email",
                  labelText: "User Email",
                  border: OutlineInputBorder(),

                ),
                onChanged: (value) => setState(() => userEmail = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field must be filled up";
                    }
                    else if (value.length<4) {
                      return "Please enter a valid User name";
                    }
                    else if(!value.contains("@")){
                      return "Invalid User email";
                    }
                  },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: userPasswordController,
                obscureText: isObsecure,
                decoration:  InputDecoration(
                  prefixIcon: (Icon(Icons.lock)), //icon inside box
                  // icon:(Icon(Icons.lock)),//icon outside before box
                  hintText: "Enter your Password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isObsecure=!isObsecure;
                    });

                  }, icon: Icon(isObsecure==true?Icons.visibility:Icons.visibility_off_outlined))
                ),

                onChanged: (value) => setState(() => userPassword = value),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid Password";
                  }
                },

              ),
              const SizedBox(
                height: 15,
              ),
              // TextFormField(
              //   controller: passcontroller2,
              //   decoration: const InputDecoration(
              //     prefixIcon: (Icon(Icons.lock)), //icon inside box
              //     // icon:(Icon(Icons.lock)),//icon outside before box
              //     hintText: "Enter Same Password",
              //     labelText: "Re Enter Password",
              //     border: OutlineInputBorder(),
              //   ),
              //   textInputAction: TextInputAction.done,
              //   onChanged: (value) => setState(() => password2 = value),
              //   validator: (value) {
              //     if (value!.length != password1 && value != password1) {
              //       return "password not match";
              //     }
              //   },
              // ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 100,
                height: 40,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                    ),
                child: TextButton(
                    onPressed: () {
                      if (mykey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      name: userEmailController.text,
                                    )));
                      }
                    },
                    child: const Text("Login",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.w400),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
