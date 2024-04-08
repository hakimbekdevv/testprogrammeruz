import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprogrammeruz/ui/home/presentation/widgets/items_widget.dart';
import 'package:testprogrammeruz/ui/home/provider/home_view_model.dart';

class TabBars extends StatelessWidget {
  const TabBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 56,
          color: Color.fromRGBO(243, 243, 243, 1),
          child: Center(
            child: SizedBox(
              height: 28,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context.watch<HomeViewModel>().buttons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<HomeViewModel>().tabButton(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.symmetric(horizontal: 10,),
                      decoration: BoxDecoration(
                          color: context.read<HomeViewModel>().selectedButton==index?Color.fromRGBO(47, 128, 237, 1):Colors.transparent,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Text(context.watch<HomeViewModel>().buttons[index],style: TextStyle(color: context.read<HomeViewModel>().selectedButton==index? CupertinoColors.white:Color.fromRGBO(144, 144, 144, 1)
                        ,),),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        context.watch<HomeViewModel>().currentTab(),
      ],
    );
  }
}
