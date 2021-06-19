import 'dart:ui';

import 'package:Grid_Wallpaper/img_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullIMG extends StatefulWidget {
  static final String id = 'full';

  int index;

  FullIMG({this.index});

  @override
  _FullIMGState createState() => _FullIMGState();
}

class _FullIMGState extends State<FullIMG> {

  int _currentPage;
  PageController controller;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    controller = PageController(
      initialPage: _currentPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Container(
            key: ValueKey<String>(imgList[_currentPage]),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgList[_currentPage]),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.80,
          widthFactor: 1.2,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
              controller: controller,
              itemCount: imgList.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(imgList[index]),
                            fit: BoxFit.cover)),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
