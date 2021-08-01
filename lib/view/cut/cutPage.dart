import 'package:Inhouse/component/cut/cutContainerList.dart';
import 'package:Inhouse/model/cutList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========CutPage build========");
    final PageController _pageController = PageController();
    return Expanded(
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: CutContainerList.build(
            context, context.select((CutList cutList) => cutList)),
      ),
    );
  }
}
