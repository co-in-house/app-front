import 'package:flutter/material.dart';

// SliverAppBar for Cut
class SliverAppBarCut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: false,
      pinned: false,
      snap: false,
    );
  }
}
