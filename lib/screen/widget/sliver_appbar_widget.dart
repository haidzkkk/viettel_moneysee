
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:viettel_money/screen/widget/search_scroll_widget.dart';

import '../../utils/circle_widget.dart';
import '../../utils/resource.dart';

enum SliverAppbarAction{
  find,
  search,
  notification,
  profile
}

class SliverAppbarWidget extends StatelessWidget {
  SliverAppbarWidget({
    super.key,
    this.addListener,
  });

  Function(SliverAppbarAction)? addListener;

  double heightStatusBar = 24;
  double collapsedHeight = 230;
  double expandedHeight = 300;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: collapsedHeight,
      expandedHeight: expandedHeight,
      leading: const SizedBox(),
      stretch: true,
      onStretchTrigger: () async {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showDialog(context: context, builder: (context){
            return const SearchScrollWidget();
          });
        });
      },

      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          var height = constraints.biggest.height;
          double opacity = height > expandedHeight
              ? 1
              : height <= collapsedHeight + heightStatusBar
                ? 0
                :height / (expandedHeight * 5);
          return FlexibleSpaceBarSettings(
            toolbarOpacity: 1,
            minExtent: collapsedHeight,
            maxExtent: expandedHeight,
            currentExtent: expandedHeight,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  )
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FlexibleSpaceBar(
                    stretchModes: const [StretchMode.zoomBackground],
                    background: Image.asset(
                      img_img3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          width: constraints.constrainWidth() - 50,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: const BorderRadiusDirectional.all(Radius.circular(100)),
                          ),
                          child: const Text("Cài đặt app trực tuyến nhận",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 100,
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(milliseconds: 300),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 20,
                              height: 50,
                              color: Colors.white,
                              child: const Icon(Icons.keyboard_arrow_left),
                            ),
                            SizedBox(
                              width: 30,
                              height: 50,
                              child: Image.asset(img_img2, fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                      ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        AppBar(
                          surfaceTintColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleWidget(
                                  size: 40,
                                  child: const Icon(Icons.person, size: 35, color: Colors.grey,)
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Image.asset(img_shield_profile, width: 25,)
                              )
                            ],
                          ),
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Chào Hải", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text("Xem số sư", style: TextStyle(fontSize: 14, color: Colors.white),),
                            ],
                          ),
                          actions: [
                            CircleWidget(
                                size: 35,
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(img_notification,)
                            ),
                            const SizedBox(width: 10,),
                            CircleWidget(
                                size: 35,
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(img_search)
                            ),
                            const SizedBox(width: 20,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleWidget(
                              size: 35,
                              padding: EdgeInsets.zero,
                              child: Image.asset(img_img1, fit: BoxFit.cover,),
                            ),
                            const SizedBox(width: 20,)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
