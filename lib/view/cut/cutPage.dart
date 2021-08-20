import 'package:Inhouse/component/cut/cutContainerList.dart';
import 'package:Inhouse/model/cutList.dart';
import 'package:Inhouse/service/api/getCutListService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========CutPage build========");
    context.read<GetCutListService>().call();
    return Scaffold(
      body: _CutContainer(),
    );
  }
}

class _CutContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return Scaffold(
      body: context.select((CutList cutList) => cutList).contentsList == null
          ? Center(child: CircularProgressIndicator())
          : PageView(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              children: CutContainerList.build(
                  context, context.select((CutList cutList) => cutList)),
            ),
    );
  }
}
