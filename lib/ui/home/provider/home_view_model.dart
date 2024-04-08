// import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../presentation/widgets/items_widget.dart';

class HomeViewModel extends ChangeNotifier {
  List buttons = ["Introducton","Catalog","Comment"];
  late CachedVideoPlayerController controller;
  int selectedButton=0;
  late CustomVideoPlayerController customVideoPlayerController;
  // late YoutubePlayerController controller;

  final CustomVideoPlayerSettings customVideoPlayerSettings = CustomVideoPlayerSettings(
    showSeekButtons: true,
    showMuteButton: false,

    customVideoPlayerProgressBarSettings: const CustomVideoPlayerProgressBarSettings(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        progressColor: Colors.blue,
        progressBarHeight: 4,
      showProgressBar: true,
      progressBarBorderRadius: 3,
    ),
    showPlayButton: true,
    alwaysShowThumbnailOnVideoPaused: true,
    controlBarDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black54
    ),
    autoFadeOutControls: true,
    placeholderWidget: Container(
        height: 280,
        width: double.infinity,
        color: Colors.black,
        child: const Center(child: CircularProgressIndicator(color: CupertinoColors.white,)),
      ),
    settingsButtonAvailable: false
  );

  void initializeVideo(context) {
    controller = CachedVideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    )..initialize().then((value) {
      notifyListeners();
    });
    customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: controller,
      customVideoPlayerSettings: customVideoPlayerSettings,
    );
  }

  /*void initializeVideo(context) async {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=HUlYekszARo")!,
        flags: const YoutubePlayerFlags(
            loop: true,
            disableDragSeek: true,
        )
    );
  }*/

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