class Results {
  double popularity;
  String knownForDepartment;
  String name;
  int id;
  String profilePath;
  bool adult;
  int gender;
  List<KnownFor> knownFor;

  Results(
      {this.popularity,
      this.knownForDepartment,
      this.name,
      this.id,
      this.profilePath,
      this.adult,
      this.gender,
      this.knownFor});

  Results.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    id = json['id'];
    profilePath = json['profile_path'];
    adult = json['adult'];
//    if (json['known_for'] != null) {
//      knownFor = new List<KnownFor>();
////      json['known_for'].forEach((v) {
////        knownFor.add(new KnownFor.fromJson(v));
////      });
//    }
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['id'] = this.id;
    data['profile_path'] = this.profilePath;
    data['adult'] = this.adult;
//    if (this.knownFor != null) {
//      data['known_for'] = this.knownFor.map((v) => v.toJson()).toList();
//    }
    data['gender'] = this.gender;
    return data;
  }
}

class KnownFor {
  String posterPath;
  int voteCount;
  bool video;
  String mediaType;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;
  String originalName;
  String name;
  List<String> originCountry;
  String firstAirDate;

  KnownFor(
      {this.posterPath,
        this.voteCount,
        this.video,
        this.mediaType,
        this.id,
        this.adult,
        this.backdropPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.title,
        this.voteAverage,
        this.overview,
        this.releaseDate,
        this.originalName,
        this.name,
        this.originCountry,
        this.firstAirDate});

  KnownFor.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    voteCount = json['vote_count'];
    video = json['video'];
    mediaType = json['media_type'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalName = json['original_name'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    firstAirDate = json['first_air_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['media_type'] = this.mediaType;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['first_air_date'] = this.firstAirDate;
    return data;
  }
}
