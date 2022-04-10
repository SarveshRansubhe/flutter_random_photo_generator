import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_photo_generator/api/random_img_api.dart';

class RandomImgApiManager {
  static var client = http.Client();

  static Future<RandomPhotoModel> getRandomImg() async {
    // ignore: non_constant_identifier_names
    var randomPhotoModel1;

    var url = Uri.parse(
        'https://api.unsplash.com/photos/random/?client_id=yourclientidhere');
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        var randomPhotoModel = RandomPhotoModel.fromJson(jsonMap);
        return randomPhotoModel;
      }
    } catch (e) {
      return randomPhotoModel1();
    }
    return randomPhotoModel1;
  }
}
