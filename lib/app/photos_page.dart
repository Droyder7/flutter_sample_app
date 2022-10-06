import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app/api.dart';
import 'package:flutter_sample_app/app/photo_model.dart';
import 'package:flutter_sample_app/widgets/custom_widgets.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowFuture<List<PhotoModel>>(
      getFuture: Api.getPhotos,
      onDone: (photos) => PhotosList(photos: photos),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<PhotoModel> photos;

  const PhotosList({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(
            photos[index].thumbnailUrl,
          ),
          title: Text(
            photos[index].title,
          ),
          subtitle: Text(
            photos[index].id.toString(),
          ),
        );
      },
    );
  }
}
