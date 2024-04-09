import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:testprogrammeruz/ui/home/provider/home_view_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TabBars extends StatelessWidget {
  final List tabNames;
  final List<Widget> tabPages;
  TabBars({super.key,required this.tabNames,required this.tabPages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 56,
          color: Colors.grey.withOpacity(.06),
          child: Center(
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabNames.length,
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      context.read<HomeViewModel>().tabButton(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 15,),
                      decoration: BoxDecoration(
                          color: context.read<HomeViewModel>().selectedButton==index?const Color.fromRGBO(47, 128, 237, 1):Colors.transparent,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        tabNames[index],
                        style: TextStyle(
                          color: context.read<HomeViewModel>().selectedButton==index?
                          CupertinoColors.white
                          :const Color.fromRGBO(144, 144, 144, 1),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: PageView(
            reverse: true,
            physics: NeverScrollableScrollPhysics(),
            controller: context.watch<HomeViewModel>().pageController,
            scrollDirection: Axis.horizontal,
            children: tabPages,
          ),
        )
      ],
    );
  }
}
