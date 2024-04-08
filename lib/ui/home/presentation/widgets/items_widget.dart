import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context)  {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset("assets/images/img.png",fit:BoxFit.cover),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Lorem Ipsum",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.black),),
                const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Lesson ",style: TextStyle(fontSize: 13,color: Color.fromRGBO(144, 144, 144, 1)),),
                    Spacer(),
                    SizedBox(
                      width: 34,
                      height: 6,
                      child: LinearProgressIndicator(
                        value: .56,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        backgroundColor: const Color.fromRGBO(218, 218, 218, 1),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}
