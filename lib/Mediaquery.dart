

import 'package:flutter/material.dart';

class Mediaquerycls extends StatelessWidget {
  const Mediaquerycls({super.key});

  @override
  Widget build(BuildContext context) {
    double mblheight= MediaQuery.of(context).size.height;
    double mblwidth= MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Mediaquery")
      ),
      body: Center(
        child: Container(
          height: mblheight ,
          width: mblwidth ,
          decoration: BoxDecoration(
            color: Colors.deepPurple
          ),
          child: Center(
            child: Text("Responsive device",style: TextStyle(
              fontSize: mblwidth * 0.09,
              color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}
