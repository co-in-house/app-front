import 'package:Inhouse/model/cutList.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';

class CutContainer extends StatefulWidget {
  const CutContainer({Key key, @required this.cutInfo}) : super(key: key);
  final OneCut cutInfo;

  @override
  _CutContainerState createState() => _CutContainerState();
}

class _CutContainerState extends State<CutContainer> {
  VideoPlayerController _controller;
  double _videoWidth;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.cutInfo.videoUrl) // .asset('videos/cut02.mp4')
      ..setLooping(true)
      ..initialize().then(
        (_) {
          _controller.play();
          setState(() {
            _videoWidth = _controller.value.aspectRatio;
          });
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double buttomHeight = MediaQuery.of(context).size.height * 0.2;
    return Stack(children: [
      Positioned(
          child: Container(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoWidth,
                height: 1,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          top: 0,
          left: 0,
          right: 0,
          bottom: 0),
      Positioned(
        child: Container(
          height: MediaQuery.of(context).padding.top + kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 45.0,
                blurRadius: 100.0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.transparent,
                    onPrimary: Colors.grey,
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      //モーダルの背景の色、透過
                      backgroundColor: Colors.transparent,
                      //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.only(top: 1),
                          decoration: BoxDecoration(
                            //モーダル自体の色
                            color: Colors.white,
                            //角丸にする
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(200),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Container(
                            height: 300,
                            // alignment: Alignment.topCenter,
                            padding: EdgeInsets.symmetric(
                                vertical: 200.0, horizontal: 0.0),
                            child: Text(
                              'へへへへ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.green,
                    onPrimary: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        top: 0,
      ),
      Positioned(
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 45.0,
                blurRadius: 100.0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.flag,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Cheer!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    animationDuration: Duration(seconds: 10),
                    primary: Colors.green,
                    onPrimary: Colors.yellow,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    print("onPressed");
                  },
                ),
              ),
            ],
          ),
        ),
        bottom: buttomHeight,
        right: 0,
        left: 0,
      ),
      Positioned(
        child: Container(
          height: buttomHeight,
          decoration: BoxDecoration(
            // color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 10.0,
                blurRadius: 10.0,
              ),
            ],
          ),
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(children: [
            Container(
              height: 40,
              child: Marquee(
                text: widget.cutInfo.description,
                style: TextStyle(color: Colors.white),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 20.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // これで両端に寄せる
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.cutInfo.iconUrl),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      widget.cutInfo.communityName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: false,
                colors: VideoProgressColors(
                  playedColor: Colors.green,
                  bufferedColor: Colors.white,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ]),
        ),
        bottom: 0,
        left: 0,
        right: 0,
      ),
    ]);
  }
}
