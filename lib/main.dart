import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/signup.dart';
import 'package:project_one/sizer.dart';
import 'package:project_one/wrap.dart';
import 'package:sizer/sizer.dart';

import 'Live xmpl/ToDo.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context , orientation , screenType ){
      return MaterialApp(
        theme: ThemeData(),
      home: Signup_(),
      );

      },

    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    bool isPassvisible = true;
    TextEditingController _Emailcontroller = TextEditingController();
    TextEditingController _Passcontroller = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          leading: Icon(
            Icons.water_drop_outlined,
            size: 45,
          ),
          title: Text("HOMETOWN"),
          centerTitle: false,
          actions: [
            ElevatedButton(
              onPressed: () {
                print("Search");
              },
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    "Eng",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                iconColor: Colors.black,
                padding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print("Help");
              },
              child: Row(
                children: [
                  Icon(Icons.headset_mic_sharp),
                  Text(
                    "Help",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  iconColor: Colors.black, padding: EdgeInsets.all(10)),
            )
          ],
        ),
        body: Column(
          children: [
            Form(
                key: _formkey,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: _Emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Email",
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email adress invalid";
                          }else if(!value.contains("@gmail.com")){
                            return "Email address will contain @gmail.com";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _Passcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Password",
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Password should be atleast 8 character";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            if(_formkey.currentState!.validate()){

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder:
                              (context)=> Page1(name: "${_Emailcontroller.text}")
                                )
                              );

                            }
                          },
                          child: Text("Submit")),
                    ),
                    
                  ],
                )
            ),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext , index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20) ,



                      ),
                      child: Icon(Icons.send_time_extension_outlined),

                    );
                  }
                  ),
            )
          ],
        )
    );
  }
}


class Page1 extends StatelessWidget {

  final String name;
  const Page1({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text(name),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Page2()));              },
              child: Text("Page 2")),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));              },
              child: Text("Page3")),
          ElevatedButton(
              onPressed: (){
                Navigator.pop((context));
                },
              child: Text("Back")),
        ],
      )
    );
  }
}
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop((context));
            },
            child: Text("Back")),
      ),
    );
  }
}


class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
            },
            child: Text("Back")),
      ),
    );
  }
}
