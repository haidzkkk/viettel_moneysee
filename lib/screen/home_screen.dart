
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:viettel_money/screen/widget/bottom_widget.dart';
import 'package:viettel_money/screen/widget/sliver_appbar_widget.dart';
import 'package:viettel_money/screen/widget/body_widget.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();

}


class HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool visibleBottomNav = true;

  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _scrollController.addListener(() {

          // is scroll> 150 and scroll down
          if(_scrollController.offset > 150 && _scrollController.position.userScrollDirection == ScrollDirection.reverse){
            visibleBottomNav = false;
          }else{
            visibleBottomNav = true;
          }
          setState(() {});
        });

        _scrollController.position.isScrollingNotifier.addListener(() {
          // is stop
          if(!_scrollController.position.isScrollingNotifier.value){
            visibleBottomNav = true;
          }
          setState(() {});
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverAppbarWidget(),
              const SliverToBoxAdapter(child: BodyWidget(),)
            ],
          ),
          Positioned(
            bottom: 20,
            child: AnimatedOpacity(
              opacity: visibleBottomNav ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: const BottomWidget(),
            ),
          )
        ],
      )
    );
  }
}
