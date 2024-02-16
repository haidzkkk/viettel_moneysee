import 'dart:async';

import 'package:flutter/material.dart';

class ScrollingText extends StatefulWidget {
  final String text;
  TextStyle? textStyle;
  Axis? scrollAxis = Axis.horizontal;
  double? ratioOfBlankToScreen = 0.25;

  ScrollingText({
    super.key,
    required this.text,
    this.textStyle,
    this.scrollAxis ,
    this.ratioOfBlankToScreen,
  }) : assert(true,);

  @override
  State<StatefulWidget> createState() {
    return ScrollingTextState();
  }
}

class ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  double screenWidth = 0;
  double screenHeight = 0;
  double position = 0.0;
  late Timer timer;
  final double _moveDistance = 3.0;
  final int _timerRest = 100;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (_key.currentContext != null) {
      double? widgetWidth =
          _key.currentContext?.findRenderObject()?.paintBounds.size.width;
      double? widgetHeight =
          _key.currentContext?.findRenderObject()?.paintBounds.size.height;

      timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
        double maxScrollExtent = scrollController.position.maxScrollExtent;
        double pixels = scrollController.position.pixels;
        if (pixels + _moveDistance >= maxScrollExtent) {
          if (widget.scrollAxis == Axis.horizontal) {
            position = (maxScrollExtent -
                screenWidth * widget.ratioOfBlankToScreen! +
                (widgetWidth ?? 0.0)) /
                2 -
                (widgetWidth ?? 0.0) +
                pixels -
                maxScrollExtent;
          } else {
            position = (maxScrollExtent -
                screenHeight * widget.ratioOfBlankToScreen! +(widgetHeight ?? 0.0)) /
                2 -
                (widgetHeight ?? 0.0) +
                pixels -
                maxScrollExtent;
          }
          scrollController.jumpTo(position);
        }
        position += _moveDistance;
        scrollController.animateTo(position,
            duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  Widget getBothEndsChild() {
    if (widget.scrollAxis == Axis.vertical) {
      String newString = widget.text.split("").join("\n");
      return Center(
        child: Text(
          newString,
          style: widget.textStyle,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Center(
        child: Text(
          widget.text,
          style: widget.textStyle,
        ));
  }

  Widget getCenterChild() {
    if (widget.scrollAxis == Axis.horizontal) {
      return Container(width: screenWidth * widget.ratioOfBlankToScreen!);
    } else {
      return Container(height: screenHeight * widget.ratioOfBlankToScreen!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: _key,
      scrollDirection: widget.scrollAxis!,
      controller: scrollController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        getBothEndsChild(),
        getCenterChild(),
        getBothEndsChild(),
      ],
    );
  }
}