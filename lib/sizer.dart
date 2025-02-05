
import 'package:flutter/material.dart';
import 'package:project_one/sizer.dart';
import 'package:sizer/sizer.dart';

class Sizercls extends StatelessWidget {
  const Sizercls({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Bank", style: TextStyle(fontSize: 25.sp),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                print("Balance");
              },
              child: Container(
                height: 10.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Icon(Icons.monetization_on_outlined,size: 30.sp,),
                      Text("Statuscheck", style: TextStyle(fontSize: 16.sp)),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
