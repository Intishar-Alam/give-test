
import 'package:flutter/material.dart';

class wrap_cls extends StatefulWidget {
  const wrap_cls({super.key});

  @override
  State<wrap_cls> createState() => _wrap_clsState();
}

class _wrap_clsState extends State<wrap_cls> {
  bool _visibility = true;
  List<String> catagories = [
    "veetables","mobile","Iphone", "Laptop", "Accessories", "home item"
  ];

  Changevis(){
    setState(() {
      _visibility = !_visibility;
    });
    print(_visibility);

  }
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Wrap(
            spacing: 9,
            runSpacing: 5,
            children: catagories.map((catagory){
              return Chip(label: Text(catagory),
              backgroundColor: Colors.purpleAccent.shade200,);

            }).toList(),
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 5,
            crossAxisSpacing: 9,
              mainAxisSpacing: 5,
              children: List.generate(100, (index){
                return Container(
                  color: Colors.purpleAccent.shade200,
                  child: Chip(label: Text(index.toString())),
                );
              }),
            ),
          )
        ],
      )
    );
  }
}


class Layoutbuilderexample extends StatelessWidget {
  const Layoutbuilderexample({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Practice",style: TextStyle(color: Colors.black,fontSize: 40),),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Wrap(
            //   children: subjects.map((subject){return Chip(label: Text("${subject}"));}).toList() ,
            // ),
            // Container(
            //   height: 500,
            //   width: 700,
            //   color: Colors.green,
            //   child: FractionallySizedBox(
            //     widthFactor: 0.8,
            //     heightFactor: 0.5,
            //
            //     child: Container(
            //       color: Colors.red,
            //       child: Text("Allignmrnt of text"),),
            //   ),
            // )
            Center(
              child: SizedBox(
                height: 300,
                width: 200,
                child: Column(
                  children: [
                    Expanded(
        
                      child: Container(
                        color: Colors.blue,
                      ),
                      flex: 14,
                    ),
                    Expanded(
        
                      child: Container(
                        color: Colors.grey,
                      ),
                      flex: 5,
                    ),
        
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  color: Colors.purple[400],
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 20,

                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.purple[300],
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Positioned(

                  right: 30,

                  bottom: 20,
                  child: Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.purple[600],
                        borderRadius: BorderRadius.circular(50)
                    ),                  ),
                ),
                Positioned(
                  left: 20,

                  bottom: 30,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(50)
                    ),                  ),
                ),

              ],
            )
          ]
        ),
      )
    );
  }
}

