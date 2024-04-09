import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:testprogrammeruz/services/utils/text_class.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/items_widget.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/tab_bars.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/video_data_widget.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/video_player_widget.dart';
import 'package:testprogrammeruz/ui/home/provider/home_view_model.dart';


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
      child: Scaffold(
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
        body: Column(
          children: [
            VideoPlayerWidget(context:context,player: const SizedBox(),),
            const VideoDataWidget(),
            const SizedBox(height: 15,),
            SingleChildScrollView(
              child: TabBars(
                tabNames:["Introducton","Catalog","Comment"],
                tabPages: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Text(TextClass.text1,style: TextStyle(fontSize: 15,),),
                  ),
                  ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const ItemsWidget(),
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ));
  }
}
