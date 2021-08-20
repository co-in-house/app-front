import 'package:flutter/material.dart';

class OnePhotoPreviewContainer extends StatelessWidget {
  const OnePhotoPreviewContainer({@required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          )),
    );
  }
}
