class Videojuegos {
  List<Videojuego> items = new List();
  Videojuegos();
  Videojuegos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final videojuego = new Videojuego.fromJsonMap(item);
      items.add(videojuego);
    }
  }
}

class Respuesta {
  int count;
  String next;
  dynamic previous;
  List<Videojuego> results;
  String seoTitle;
  String seoDescription;
  String seoKeywords;
  String seoH1;
  bool noindex;
  bool nofollow;
  String description;
  Filters filters;
  List<String> nofollowCollections;

  Respuesta({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });
}

class Filters {
  List<FiltersYear> years;

  Filters({
    this.years,
  });
}

class FiltersYear {
  int from;
  int to;
  String filter;
  int decade;
  List<YearYear> years;
  bool nofollow;
  int count;

  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });
}

class YearYear {
  int year;
  int count;
  bool nofollow;

  YearYear({
    this.year,
    this.count,
    this.nofollow,
  });
}

class Videojuego {
  int id;
  String slug;
  String name;
  String released;
  bool tba;
  String backgroundImage;
  double rating;
  int ratingTop;
  List<dynamic> ratings;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  int metacritic;
  int playtime;
  int suggestionsCount;
  dynamic userGame;
  int reviewsCount;
  String saturatedColor;
  String dominantColor;
  List<dynamic> platforms;
  List<dynamic> parentPlatforms;
  List<dynamic> genres;

  Videojuego({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
  });
  Videojuego.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    slug = json["slug"];
    name = json["name"];
    released = json["released"];
    tba = json["tba"];
    backgroundImage = json["background_image"];
    rating = json["rating"] / 1;
    ratingTop = json["ratingTop"];
    ratings = json["ratings"];
    ratingsCount = json["ratings_count"];
    reviewsTextCount = json["reviews_text_count"];
    added = json["added"];
    metacritic = json["metacritic"];
    playtime = json["playtime"];
    suggestionsCount = json["suggestions_count"];
    userGame = json["user_game"];
    reviewsCount = json["reviews_count"];
    saturatedColor = json["saturated_color"];
    dominantColor = json["dominant_color"];
    platforms = json["platforms"];
    parentPlatforms = json["parent_platforms"];
    genres = json["genres"];
  }

  String getImageBackGround() {
    if (this.backgroundImage == null)
      return "https://image.freepik.com/free-vector/error-with-glitch-effect-screen-error-404-page-found_143407-1.jpg";
    return this.backgroundImage;
  }
}

class AddedByStatus {
  int yet;
  int owned;
  int beaten;
  int toplay;
  int dropped;
  int playing;

  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });
}

class Clip {
  String clip;
  Map<String, String> clips;
  String video;
  String preview;

  Clip({
    this.clip,
    this.clips,
    this.video,
    this.preview,
  });
}

enum Color { THE_0_F0_F0_F }

class Genre {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;
  Domain domain;
  Language language;

  Genre({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });
}

enum Domain {
  EPICGAMES_COM,
  STORE_PLAYSTATION_COM,
  MICROSOFT_COM,
  MARKETPLACE_XBOX_COM,
  STORE_STEAMPOWERED_COM,
  GOG_COM,
  APPS_APPLE_COM,
  PLAY_GOOGLE_COM,
  NINTENDO_COM
}

enum Language { ENG }

class ParentPlatform {
  ParentPlatformPlatform platform;

  ParentPlatform({
    this.platform,
  });
}

class ParentPlatformPlatform {
  int id;
  Name name;
  Slug slug;

  ParentPlatformPlatform({
    this.id,
    this.name,
    this.slug,
  });
}

enum Name {
  PC,
  PLAY_STATION,
  XBOX,
  APPLE_MACINTOSH,
  LINUX,
  NINTENDO,
  ANDROID,
  I_OS
}

enum Slug { PC, PLAYSTATION, XBOX, MAC, LINUX, NINTENDO, ANDROID, IOS }

class PlatformElement {
  PlatformPlatform platform;
  String releasedAt;
  Requirements requirementsEn;
  Requirements requirementsRu;

  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });
}

class PlatformPlatform {
  int id;
  String name;
  String slug;
  dynamic image;
  dynamic yearEnd;
  int yearStart;
  int gamesCount;
  String imageBackground;

  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });
}

class Requirements {
  String minimum;
  String recommended;

  Requirements({
    this.minimum,
    this.recommended,
  });
}

class Rating {
  int id;
  Title title;
  int count;
  double percent;

  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });
}

enum Title { EXCEPTIONAL, RECOMMENDED, MEH, SKIP }

class ShortScreenshot {
  int id;
  String image;

  ShortScreenshot({
    this.id,
    this.image,
  });
}

class Store {
  int id;
  Genre store;
  String urlEn;
  String urlRu;

  Store({
    this.id,
    this.store,
    this.urlEn,
    this.urlRu,
  });
}
