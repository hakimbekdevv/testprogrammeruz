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
                Text("Travel English",style: Theme.of(context).textTheme.bodyLarge,),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bookmark,color: Colors.grey,size: 30,),
                )
              ],
            ),
            Text("Beginner  . 83.2 Students",style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 15,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage('assets/images/img.png'),
                ),
                const SizedBox(width: 10,),
                Text("Anama Kirochi",style: Theme.of(context).textTheme.bodySmall)
              ],
            )
          ],
        ),
      ),
    );
  }
}
