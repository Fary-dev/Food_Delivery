final String tableFavoriteRes = 'favoriteRes';

class FavoriteResFields {
  static final List<String>values=[
    licked,id,nameResturant,
  ];
  static final String id = '_id';
  static final String licked = 'licked';
  static final String nameResturant = 'nameResturant';
}

class FavoritResturantList {

  final bool licked;
  final int id;
  final String nameResturant;

  const FavoritResturantList({
    this.licked,
    this.id,
    this.nameResturant,
  });

  static FavoritResturantList fromJson(Map<String,Object>json)=>FavoritResturantList(
    id: json[FavoriteResFields.id] as int,
    licked: json[FavoriteResFields.licked] ==1,
    nameResturant: json[FavoriteResFields.nameResturant] as String,
  );

  Map<String, Object> toJson() => {
        FavoriteResFields.id: id,
        FavoriteResFields.licked: licked ? 1 : 0,
        FavoriteResFields.nameResturant: nameResturant,
      };

  FavoritResturantList copy({
    int id,
    bool licked,
    String nameResturant,
  }) =>
      FavoritResturantList(
        id: id ?? this.id,
        licked: licked ?? this.licked,
        nameResturant: nameResturant ?? this.nameResturant,
      );
}
