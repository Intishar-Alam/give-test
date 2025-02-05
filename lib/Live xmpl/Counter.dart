
import 'package:flutter/material.dart';

class Counterapp extends StatefulWidget {
  const Counterapp({super.key});

  @override
  State<Counterapp> createState() => _CounterappState();
}

class _CounterappState extends State<Counterapp> {
  int _counter =0 ;

  _Increasecounter(){
    setState(() {
      _counter++;
    });
    print(_counter);

  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Count ${_counter.toString()}", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed:  _Increasecounter,child: Icon(Icons.add,size: 50,),),
    );
  }
}
