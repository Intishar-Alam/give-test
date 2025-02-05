
import 'package:flutter/material.dart';

class Statecls extends StatefulWidget {
  const Statecls({super.key});

  @override
  State<Statecls> createState() => _StateclsState();
}

class _StateclsState extends State<Statecls> {
  List<String> _tasks=[];
  TextEditingController _Taskcontroller = TextEditingController();

  _addtask(){
    if(_Taskcontroller.text.isNotEmpty){
      setState(() {
        _tasks.add(_Taskcontroller.text);
        _Taskcontroller.clear();
      });
    }
  }
  _removetask(int index){

      setState(() {
        _tasks.removeAt(index);
      });

  }

  _removeall(){
    setState(() {
      _tasks.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("TO DO TASK",style: TextStyle(color: Colors.white,fontSize: 30),),
        elevation: 5,
        shadowColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            TextField(
              controller: _Taskcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                hintText: "Enter your task",
                suffixIcon: IconButton(onPressed:  _addtask
                , icon: Icon(Icons.add))
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                  itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.black,

                    child: ListTile(
                      title: Text(_tasks[index]),
                      trailing: IconButton(onPressed: ()=> _removetask(index), icon: Icon(Icons.delete_outline_outlined)),
                    ),
                  );
                  }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _removeall,
          child: Icon(Icons.delete),
      ),
    );
  }
}

