import 'package:videojuegos/src/pages/videojuego_detalles.dart';

class VideojuegoDetalleOne {
  VideojuegoDetallesModel itemVDetalle = new VideojuegoDetallesModel();
  VideojuegoDetalleOne();
  VideojuegoDetalleOne.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final videojuego = new VideojuegoDetallesModel.fromJsonMap(item);
      itemVDetalle = videojuego;
    }
  }
}

class VideojuegoDetallesModel {
  int id;
  String slug;
  String name;
  String nameOriginal;
  String description;
  dynamic metacritic;
  List<dynamic> metacriticPlatforms;
  String released;
  bool tba;
  String updated;
  String backgroundImage;
  String backgroundImageAdditional;
  String website;
  double rating;
  int ratingTop;
  List<Rating> ratings;
  Reactions reactions;
  int added;
  AddedByStatus addedByStatus;
  int playtime;
  int screenshotsCount;
  int moviesCount;
  int creatorsCount;
  int achievementsCount;
  int parentAchievementsCount;
  String redditUrl;
  String redditName;
  String redditDescription;
  String redditLogo;
  int redditCount;
  int twitchCount;
  int youtubeCount;
  int reviewsTextCount;
  int ratingsCount;
  int suggestionsCount;
  List<dynamic> alternativeNames;
  String metacriticUrl;
  int parentsCount;
  int additionsCount;
  int gameSeriesCount;
  dynamic userGame;
  int reviewsCount;
  int communityRating;
  String saturatedColor;
  String dominantColor;
  List<ParentPlatform> parentPlatforms;
  List<PlatformElement> platforms;
  List<Store> stores;
  List<Developer> developers;
  List<Developer> genres;
  List<Developer> tags;
  List<Developer> publishers;
  EsrbRating esrbRating;
  dynamic clip;
  String descriptionRaw;

  VideojuegoDetallesModel({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.communityRating,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });
  VideojuegoDetallesModel.fromJsonMap(Map<String, dynamic> jsonList) {
    this.id = jsonList["id"];
    this.slug = jsonList["slug"];
    this.name = jsonList["name"];
    this.nameOriginal = jsonList["name_original"];
    this.description = jsonList["description"];
    this.metacritic = jsonList["metacritic"];
    this.released = jsonList["released"];
    this.tba = jsonList["tba"];
    this.updated = jsonList["updated"];
    this.backgroundImage = jsonList["background_image"];
    this.backgroundImageAdditional = jsonList["background_image_additional"];
    this.website = jsonList["website"];
    this.rating = jsonList["rating"];
    this.achievementsCount = jsonList["achievements_count"];
    this.descriptionRaw = jsonList["description_raw"];
  }
}

class AddedByStatus {
  int yet;
  int owned;
  int beaten;

  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
  });
}

class Developer {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;
  String domain;
  Language language;

  Developer({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });
}

enum Language { ENG }

class EsrbRating {
  int id;
  String name;
  String slug;

  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });
}

class ParentPlatform {
  EsrbRating platform;

  ParentPlatform({
    this.platform,
  });
}

class PlatformElement {
  PlatformPlatform platform;
  String releasedAt;
  Requirements requirements;

  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirements,
  });
}

class PlatformPlatform {
  int id;
  String name;
  String slug;
  dynamic image;
  dynamic yearEnd;
  dynamic yearStart;
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

  Requirements({
    this.minimum,
  });
}

class Rating {
  int id;
  String title;
  int count;
  double percent;

  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });
}

class Reactions {
  Reactions();
}

class Store {
  int id;
  String url;
  Developer store;

  Store({
    this.id,
    this.url,
    this.store,
  });
}
