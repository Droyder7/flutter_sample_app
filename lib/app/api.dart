import 'package:http/http.dart' as http;
import 'package:flutter_sample_app/app/photo_model.dart';

var jsonResponse = '''[
  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  }
]''';

class Api {
  static Future<List<PhotoModel>?> getPhotos() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(apiUrl));

    return Future.delayed(const Duration(seconds: 2), () {
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        jsonResponse = response.body;
        // print(jsonResponse);
        return photosFromJson(jsonResponse);
        // throw Exception('Failed to load photos'); // try throwing exception
        // return null; // test null response
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load photos');
      }
    });
  }
}
