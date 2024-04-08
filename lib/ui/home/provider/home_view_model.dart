import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


import '../presentation/widgets/items_widget.dart';

class HomeViewModel extends ChangeNotifier {
  List buttons = ["Introducton","Catalog","Comment"];
  final controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
  int selectedButton=0;
  late ChewieController chewieController;
  late Chewie playerWidget;

  void initializeVideo(context) async {
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      aspectRatio: 16/9,
      looping: false,
      allowPlaybackSpeedChanging: false,
      allowMuting: false,
      allowFullScreen: true,
      cupertinoProgressColors: ChewieProgressColors(
        playedColor: Colors.blue,
        backgroundColor: Colors.grey,
      )
    );
    playerWidget = Chewie(
      controller: chewieController,
    );
    await controller.initialize();
  }

  void disposeVideo() {
    controller.pause();
    notifyListeners();
  }

  void tabButton(index) {
    selectedButton = index;
    notifyListeners();
  }

  currentTab() {
    if (selectedButton==0) {
      return const SizedBox();
    } else if (selectedButton==1) {
      return ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const ItemsWidget(),
      );
    } else {
      return const SizedBox();
    }
  }


}