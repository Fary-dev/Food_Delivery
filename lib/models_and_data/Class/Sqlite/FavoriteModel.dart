
class FavoriteModel {
  int? id;
  String? name;
  String? owner;

  FavoriteModel({this.id, this.name, this.owner});

  factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        id: json['id'],
        name: json['name'],
        owner: json['owner'],
      );

  Map<String, dynamic> toMap() => {

        "id": id,
        "name": name,
        "owner": owner,
      };
}


