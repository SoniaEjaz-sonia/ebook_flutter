import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../router.dart';
import '../../book_details/screens/book_details_screen.dart';
import '../data/models/category_feed.dart';
import 'loading_widget.dart';

class BookCard extends StatelessWidget {
  final String img;
  final Entry entry;

  BookCard({
    Key? key,
    required this.img,
    required this.entry,
  }) : super(key: key);

  static const uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          onTap: () {
            MyRouter.pushPage(
              context,
              BookDetailsScreen(
                entry: entry,
                imgTag: imgTag,
                titleTag: titleTag,
                authorTag: authorTag,
              ),
            );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Hero(
              tag: imgTag,
              child: CachedNetworkImage(
                imageUrl: img,
                placeholder: (context, url) => const LoadingWidget(
                  isImage: true,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/place.png',
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
