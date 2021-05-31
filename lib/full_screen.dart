import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:wallpaper_manager/wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  final imageurl;
  FullScreen({this.imageurl});
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> setWallpaper() async {
      String url = widget.imageurl;
      int location = WallpaperManager
          .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set Wallpaper",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Expanded(
              child: Container(
                child: Image.network(
                  widget.imageurl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setWallpaper();
                  },
                  icon: Icon(
                    Icons.image,
                    size: 20,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.download,
                    size: 20,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: 20,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
