
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
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
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      clipBehavior: Clip.hardEdge,
      child:
      CustomVideoPlayer(
        customVideoPlayerController: context.watch<HomeViewModel>().customVideoPlayerController,
      ),
    );
  }
}
