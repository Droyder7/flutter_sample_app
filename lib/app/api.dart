import 'package:http/http.dart' as http;
import 'package:flutter_sample_app/app/photo_model.dart';

class Api {
  static Future<List<PhotoModel>> getPhotos() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return photosFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load photos');
    }
  }
}
