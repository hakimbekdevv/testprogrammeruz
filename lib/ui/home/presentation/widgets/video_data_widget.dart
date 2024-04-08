import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDataWidget extends StatelessWidget {
  const VideoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Travel English",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: CupertinoColors.black),),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bookmark,color: Colors.grey,size: 30,),
                )
              ],
            ),
            const Text("Beginner  . 83.2 Students",style: TextStyle(color: Colors.grey,fontSize: 13),),
            const SizedBox(height: 15,),
            const Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage('assets/images/img.png'),
                ),
                SizedBox(width: 10,),
                Text("Anama Kirochi",style: TextStyle(color: Colors.grey,fontSize: 13),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
