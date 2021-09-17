// SliverAppBar for Lounge
import 'package:flutter/material.dart';

class SliverAppBarLounge extends StatelessWidget {
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
