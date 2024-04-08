import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/items_widget.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/tab_bars.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/video_data_widget.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/video_player_widget.dart';
import 'package:testprogrammeruz/ui/home/provider/home_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeViewModel>().initializeVideo(context);
    super.initState();
  }

  @override
  void deactivate() {
    context.watch<HomeViewModel>().controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        context.read<HomeViewModel>().disposeVideo();
      },
      child: YoutubePlayerBuilder(
        player:  YoutubePlayer(
          controller: context.watch<HomeViewModel>().controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          bottomActions: [
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                playedColor: Colors.blue,
                handleColor: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            RemainingDuration(),
            FullScreenButton(),
          ],
        ),
        builder: (p0, p1) {
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              title: const Text("Details"),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [

                  VideoPlayerWidget(context:context,player: p1,),
                  const VideoDataWidget(),
                  const SizedBox(height: 15,),
                  const TabBars(),
                ],
              ),
            ),
          );
        },
    ));
  }
}
