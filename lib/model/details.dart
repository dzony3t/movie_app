class Details {
  bool adult;
  String backdropPath;
  int budget;
  List<Genres> genres;
  int id;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int runtime;
  String title;
  double voteAverage;
  int voteCount;

  Details(
      {this.adult,
        this.backdropPath,
        this.budget,
        this.genres,
        this.id,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.runtime,
        this.title,
        this.voteAverage,
        this.voteCount});

  Details.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    id = json['id'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      json['production_companies'].forEach((v) {
      });
    }
    if (json['production_countries'] != null) {
      json['production_countries'].forEach((v) {
      });
    }
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['runtime'] = this.runtime;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}