import 'package:json_annotation/json_annotation.dart';

part 'new_and_hot_response.g.dart';

@JsonSerializable()
class NewAndHotResponse {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<NewAndHotResult> results;

  NewAndHotResponse({this.page, this.results = const []});

  factory NewAndHotResponse.fromJson(Map<String, dynamic> json) {
    return _$NewAndHotResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewAndHotResponseToJson(this);
}

@JsonSerializable()
class NewAndHotResult {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  //Incase of tv series use original name instead of original title
  @JsonKey(name: 'original_name')
  String? originalName;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;

  NewAndHotResult({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory NewAndHotResult.fromJson(Map<String, dynamic> json) {
    return _$NewAndHotResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewAndHotResultToJson(this);
}
