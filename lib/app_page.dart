import 'package:flutter/material.dart';
import 'package:flutter_sample_app/hotel_model.dart';
import 'package:flutter_sample_app/widgets/custom_widgets.dart';
import 'package:sanity_client/sanity_client.dart';

class AppPage extends StatelessWidget {
  // Page widget contains Scaffold with app bar and body

  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sample App'),
      ),
      body: const SanityPage(),
    );
  }
}

const Map<String, dynamic> sanityEnvMap = {
  'SANITY_PROJECT_ID': '8axtof0t',
  'SANITY_DATASET': 'production',
  'SANITY_TOKEN':
      'sk8L9hFpwZaQqiPvFrqfFTwzQircEFtEA2IIsyeRUJsfey3sbRrtIYSvoBbkwc3hdQt0DmndBaFRzSaQj9zgDAQYXqGiFpR0jH4Q9mckjobxlttuBZfszGdwbWmT5Xe5gobqNZIA9d87X6YXPdlnygQqJq8Ne6jjowlUb4CRWtkVogiV0ME7',
};

final sanityClient = SanityClient(
  dataset: sanityEnvMap['SANITY_DATASET'],
  projectId: sanityEnvMap['SANITY_PROJECT_ID'],
  token: sanityEnvMap['SANITY_TOKEN'],
);

Future<List<Hotel>?> getHotels() async {
  const query = '''*[_type == "hotel"]{
  title,
  description,
  location,
  address,
  propertyType,
  rating,
  mainImage,
  altImages,
  phoneNo,
  checkInTime,
  checkOutTime,
  id
}''';

  final response = await sanityClient.fetch(query: query);

  return hotelFromJson(response);
}

class SanityPage extends StatelessWidget {
  const SanityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var response = sanityClient.fetch(query: query).then( (data) => print(data));

    return ShowFuture<List<Hotel>>(
      getFuture: () => getHotels(),
      onDone: (hotels) => HotelWidget(hotel: hotels[0]),
    );
  }
}

class HotelWidget extends StatelessWidget {
  const HotelWidget({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final hotelImageRef = hotel.mainImage.asset.ref;

    final hotelImageUrl = sanityClient.imageUrl(hotelImageRef, width: 50);

    print(hotelImageUrl);

    return Column(
      children: [
        ListTile(
          title: Text(hotel.title),
          subtitle: Text(
            hotel.description,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Image.network(hotelImageUrl),
        ),
        Image.network(sanityClient.imageUrl(hotelImageRef, width: 100)),
        Image.network(sanityClient.imageUrl(hotelImageRef, width: 200)),
        Image.network(sanityClient.imageUrl(hotelImageRef, height: 200)),
      ],
    );
  }
}
