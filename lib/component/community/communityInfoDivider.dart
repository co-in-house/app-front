import 'package:Inhouse/component/community/communityInfoListDelegate.dart';
import 'package:flutter/material.dart';

class CommunityInfoDivider extends CommunityBaseContainer {
  @override
  buildChild(BuildContext context) {
    return Divider(
      color: Colors.grey[400],
      height: 0,
    );
  }
}
