import 'package:Inhouse/component/appBar/sliverAppBarLounge.dart';
import 'package:Inhouse/component/lounge/notificationNumberBadge.dart';
import 'package:Inhouse/component/lounge/roomModalContainer.dart';
import 'package:Inhouse/model/lounge/tappedRoomInfoForModal.dart';
import 'package:Inhouse/service/lounge/changeRoom.dart';
import 'package:Inhouse/util/modal.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

class LoungePage extends StatelessWidget {
  final double _spacingWidth = 0.0;
  final List<String> imgUrlList = [
    'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg',
    'https://64.media.tumblr.com/791392df90cb390e7a1076bdc9547ffd/tumblr_ptj0tqzT2A1thp44k_1280.png',
    'https://64.media.tumblr.com/3e5792a04109840aa74819243fcaf6ad/746ebbed892bd5ec-88/s2048x3072/4e1b703580da2e7b69658de2516d412546abdbe1.png',
    'https://64.media.tumblr.com/a014c09e5e3905603ffa1c75a3e97ec9/49738d00faa5d9d4-18/s640x960/5e4024abab76e75829098ab739175e20a7e75438.jpg',
    'https://64.media.tumblr.com/44e4aaf548d3b3e195de4457f1c2c14d/c455752c87bc13b4-2d/s1280x1920/f32636db77b84026bc59b3e22c7650dc9173eaab.jpg',
    'https://64.media.tumblr.com/259935e3cdb070c19f030a73975a18f1/af923cc300e69400-01/s2048x3072/e275f611ee87dc824cdab031861efc401acbb35c.jpg',
    'https://jojo-portal.com/wp-content/uploads/2021/03/jojo_canvas_0315_02.jpg',
    'https://www.gamers.co.jp/resize_image.php?image=04281727_60891c5eb8e58.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    print("========LoungePage build========");

    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarLounge(),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              mainAxisSpacing: _spacingWidth,
              crossAxisSpacing: _spacingWidth,
              childAspectRatio: 1.0,
            ),
            delegate: LoungeCommunityListDelegate(context, imgUrlList),
          ),
        ],
      ),
    );
  }
}

class LoungeCommunityListDelegate extends SliverChildListDelegate {
  LoungeCommunityListDelegate(BuildContext context, List<String> imgUrlList)
      : super(_LoungeCommunityListDelegate.build(context, imgUrlList));
  BuildContext context;
}

class _LoungeCommunityListDelegate {
  static List<Widget> build(BuildContext context, List<String> imgUrlList) {
    List<Widget> list = [];
    if (imgUrlList != null && imgUrlList.isNotEmpty && imgUrlList.length > 0) {
      for (int index = 0; index < imgUrlList.length; index++) {
        list.add(OnePhotoContainer(
          urlList: imgUrlList,
          currentIndex: index,
        ));
      }
    }
    return list;
  }
}

class OnePhotoContainer extends StatelessWidget {
  const OnePhotoContainer({
    @required this.urlList,
    @required this.currentIndex,
  });
  final List<String> urlList;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Positioned(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Const.borderRadius),
                ),
                elevation: 10.0,
                child: InkWell(
                  onTap: () async {
                    TappedRoomInfoForModal tappedRoomInfo = await roomModal(
                      context: context,
                      content: RoomModalContainer(),
                    );
                    if (tappedRoomInfo != null &&
                        tappedRoomInfo.index != null) {
                      print(
                        "tappedRoomNumber : " +
                            tappedRoomInfo.index.toString() +
                            ", name : " +
                            tappedRoomInfo.label,
                      );
                      Const.miniplayerController
                          .animateToHeight(state: PanelState.MAX);
                      context.read<ChangeRoom>().set(
                            tappedRoomInfo.index,
                            tappedRoomInfo.index,
                            tappedRoomInfo.label,
                            "コミュニティ名",
                          );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Const.borderRadius)),
                      image: DecorationImage(
                        image: NetworkImage(urlList[currentIndex]),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: NotificationNumberBadge(value: 10),
            top: 0,
            left: 0,
          ),
        ],
      ),
    );
  }
}
