import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../configs/colors.dart';
import 'carousel_pro_widgets.dart';

class GalleryExampleItem {
  GalleryExampleItem(
      {this.id, this.resource, this.isNetWorkImage = false, this.url});

  final String? id;
  final String? resource;
  final String? url;
  final bool? isNetWorkImage;
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({super.key, 
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex!);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int? initialIndex;
  final PageController? pageController;
  final List<GalleryExampleItem>? galleryItems;
  final Axis? scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int? currentIndex;
  var _controller;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: currentIndex ?? 0);
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems!.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: _controller,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection!,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: (const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0))),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DotsIndicator(
                    controller: _controller,
                    itemCount:widget.galleryItems!.length,
                    color: AppColors.lightGray2.withOpacity(0.3),
                    dotSize: 4.5,
                    dotSpacing: 14.0,
                    dotIncreaseSize: 2.0,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              ),
            ),

//            Container(
//              padding: const EdgeInsets.all(20.0),
//              child: Text(
//                "Image ${currentIndex + 1}",
//                style: const TextStyle(
//                  color: Colors.white,
//                  fontSize: 17.0,
//                  decoration: null,
//                ),
//              ),
//            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryExampleItem item = widget.galleryItems![index];
    return item.isNetWorkImage!
        ? PhotoViewGalleryPageOptions(
      imageProvider:  CachedNetworkImageProvider(
        item.url!,
      ),
      initialScale: PhotoViewComputedScale.contained,
      //minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id!),
    )
        : PhotoViewGalleryPageOptions(
      imageProvider:
      // item.resource != null ?
      AssetImage(item.resource!),
      // : CachedNetworkImage(
      //     imageUrl: item.url,
      //     errorWidget: (context, url, error) => Icon(
      //       Icons.error,
      //       color: AppColors.lightGray2,
      //     ),
      //   ),
      initialScale: PhotoViewComputedScale.contained,
      //minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 1.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id!),
    );
  }


}
