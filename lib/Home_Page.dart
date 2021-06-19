import 'package:Grid_Wallpaper/full_img.dart';
import 'package:Grid_Wallpaper/img_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  static final String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(12),
        child: new StaggeredGridView.countBuilder(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => FullIMG(index: index,)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imgList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1.8 : 2.2);
            }),
      ),
    );
  }
}
