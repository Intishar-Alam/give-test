import 'package:flutter/material.dart';
import 'package:project_one/wrap.dart';

class Signup_ extends StatelessWidget {
  const Signup_({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Signupscreen(),
    );
  }
}

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();


  double _linearvalue=0;

  void _showanother(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> wrap_cls()));
  }

  void updateformprogress(){
    var progress=0.0;

    final controllers=[
      _firstnamecontroller,
      _lastnamecontroller,
      _usernamecontroller
    ];





    for(var controller in controllers){
      if(controller.value.text.isNotEmpty){
        progress +=1/controllers.length;
      }
    }

    setState(() {
      _linearvalue = progress;
    });


  }



  @override
  Widget build(BuildContext context) {


    return  Form(
      onChanged: updateformprogress,
        child: Column(
          children: [
            LinearProgressIndicator(
              color: _linearvalue==1? Colors.green : Colors.orangeAccent ,
              value: _linearvalue ,
            ),
            Text("SIGNUP",style: Theme.of(context).textTheme.headlineMedium),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _firstnamecontroller,
                decoration: InputDecoration(
                  hintText: "Firstname"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _lastnamecontroller,
                decoration: InputDecoration(
                    hintText: "Last Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                    hintText: "Username"
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: _linearvalue == 1? Colors.blue : Colors.transparent,
                foregroundColor: _linearvalue == 1? Colors.white : Colors.grey,

              ),

                onPressed: _linearvalue == 1 ? _showanother : null,
                child: Text("Sign up"))
          ],
        )
    );
  }
}

