import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$baseURL/trending/all/day?api_key=$apiKey";
  static const search = "$baseURL/search/movie?api_key=$apiKey";
}
