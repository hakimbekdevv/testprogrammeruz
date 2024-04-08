
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprogrammeruz/ui/home/provider/home_view_model.dart';

class VideoPlayerWidget extends StatelessWidget {
  BuildContext context;
  Widget player;
  VideoPlayerWidget({super.key,required this.context,required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      clipBehavior: Clip.hardEdge,
      child: Theme(
            data: ThemeData.light().copyWith(
              platform: TargetPlatform.iOS,
            ),
            child: Chewie(
              controller: context.watch<HomeViewModel>().chewieController,
            ),
          )

    );
  }
}
