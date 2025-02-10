
import 'package:flutter/material.dart';
import 'package:project_one/main.dart';
import 'package:sizer/sizer.dart';

class Respon_1 extends StatelessWidget {
  const Respon_1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Responsive"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("This is a sncakbar",style: TextStyle(color: Colors.white),),
              duration: Duration(seconds: 3),
              action: SnackBarAction(label: "Undo", onPressed: (){}),
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              // padding: EdgeInsets.all(10),

            ));

          }, child: Text("Snackbar")),
          ElevatedButton(onPressed: (){
            showModalBottomSheet(
              // isScrollControlled: true,
                isDismissible: true,
                enableDrag: true,
                context: context,

                builder: (context){

              return SizedBox(
                width: double.infinity,
                child: Column(

                  children: [
                    Text("Bottom Sheet",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    )
                  ],
                ),
              );
                }
            );
          }, child: Text("Bottom Sheet")),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context)=> AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you really want to delete this?"),
              actions: [
                Row(
                  children: [
                    TextButton(onPressed: (){}, child: Text("Yes")),
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("No")),

                  ],
                )
              ],
            ));
          }, child: Text("Alertdialog")),
          SizedBox(height: 20,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                container_(contimage: 'https://media1.thrillophilia.com/filestore/9nt5y79npr0qachpwx53w6sffkkb_spectacular-architectures-in-dhaka-the-famous-five-021174-scaled.jpg?w=753&h=450&dpr=2.0',
                    titletext: "History",
                    contenttext: "kasmasmamsmss"),
                SizedBox(width: 20,),
            container_(contimage: 'https://media1.thrillophilia.com/filestore/9nt5y79npr0qachpwx53w6sffkkb_spectacular-architectures-in-dhaka-the-famous-five-021174-scaled.jpg?w=753&h=450&dpr=2.0',
                titletext: "Histasasasasory",
                contenttext: "asasas"),
                SizedBox(width: 20,),

              container_(contimage: 'https://media1.thrillophilia.com/filestore/9nt5y79npr0qachpwx53w6sffkkb_spectacular-architectures-in-dhaka-the-famous-five-021174-scaled.jpg?w=753&h=450&dpr=2.0',
    titletext: "hello",
    contenttext: "asasasas"),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class container_ extends StatelessWidget {
  String contimage,titletext,contenttext;
   container_({
    super.key,required this.contimage, required this.titletext, required this.contenttext
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(contimage),
          Text(titletext,style: TextStyle(color: Colors.white),),
          Text(contenttext,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
