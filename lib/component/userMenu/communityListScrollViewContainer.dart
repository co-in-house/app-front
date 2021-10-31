import 'package:inhouse/component/userMenu/userProfileSubscribedCommunityRow.dart';
import 'package:flutter/material.dart';

class CommunityListScrollViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'ハッピーミーティング',
      url:
          'https://64.media.tumblr.com/791392df90cb390e7a1076bdc9547ffd/tumblr_ptj0tqzT2A1thp44k_1280.png',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'アニメ愛好会',
      url:
          'https://64.media.tumblr.com/3e5792a04109840aa74819243fcaf6ad/746ebbed892bd5ec-88/s2048x3072/4e1b703580da2e7b69658de2516d412546abdbe1.png',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'ピカソ研究会',
      url:
          'https://64.media.tumblr.com/a014c09e5e3905603ffa1c75a3e97ec9/49738d00faa5d9d4-18/s640x960/5e4024abab76e75829098ab739175e20a7e75438.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'ぺっぺけぺっぺっぺー',
      url:
          'https://64.media.tumblr.com/44e4aaf548d3b3e195de4457f1c2c14d/c455752c87bc13b4-2d/s1280x1920/f32636db77b84026bc59b3e22c7650dc9173eaab.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'FF14ガチ勢',
      url:
          'https://64.media.tumblr.com/259935e3cdb070c19f030a73975a18f1/af923cc300e69400-01/s2048x3072/e275f611ee87dc824cdab031861efc401acbb35c.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: '黄金の風',
      url:
          'https://jojo-portal.com/wp-content/uploads/2021/03/jojo_canvas_0315_02.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: '新世紀ヱヴァンゲリオン',
      url:
          'https://www.gamers.co.jp/resize_image.php?image=04281727_60891c5eb8e58.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'ハッピーミーティング',
      url:
          'https://64.media.tumblr.com/791392df90cb390e7a1076bdc9547ffd/tumblr_ptj0tqzT2A1thp44k_1280.png',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'アニメ愛好会',
      url:
          'https://64.media.tumblr.com/3e5792a04109840aa74819243fcaf6ad/746ebbed892bd5ec-88/s2048x3072/4e1b703580da2e7b69658de2516d412546abdbe1.png',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'ピカソ研究会',
      url:
          'https://64.media.tumblr.com/a014c09e5e3905603ffa1c75a3e97ec9/49738d00faa5d9d4-18/s640x960/5e4024abab76e75829098ab739175e20a7e75438.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'ぺっぺけぺっぺっぺー',
      url:
          'https://64.media.tumblr.com/44e4aaf548d3b3e195de4457f1c2c14d/c455752c87bc13b4-2d/s1280x1920/f32636db77b84026bc59b3e22c7650dc9173eaab.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: 'FF14ガチ勢',
      url:
          'https://64.media.tumblr.com/259935e3cdb070c19f030a73975a18f1/af923cc300e69400-01/s2048x3072/e275f611ee87dc824cdab031861efc401acbb35c.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: '黄金の風',
      url:
          'https://jojo-portal.com/wp-content/uploads/2021/03/jojo_canvas_0315_02.jpg',
    ));
    _children.add(UserProfileSubscribedCommunityRow(
      communityName: '新世紀ヱヴァンゲリオン',
      url:
          'https://www.gamers.co.jp/resize_image.php?image=04281727_60891c5eb8e58.jpg',
    ));
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: _children,
        ),
      ),
    );
  }
}
