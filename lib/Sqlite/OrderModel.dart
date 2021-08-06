class OrderModel {
  int? id;
  int? idProduct;
  String? nameResturant;
  String? dateTime;
  String? nameProduct;
  double? priceProduct;

  OrderModel({
    this.id,
    this.nameResturant,
    this.dateTime,
    this.idProduct,
    this.nameProduct,
    this.priceProduct,
  });

  OrderModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    idProduct = map['idProduct'];
    nameResturant = map['nameResturant'];
    dateTime = map['dateTime'];
    nameProduct = map['nameProduct'];
    priceProduct = map['priceProduct'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['idProduct'] = idProduct;
    map['nameResturant'] = nameResturant;
    map['dateTime'] = dateTime;
    map['nameProduct'] = nameProduct;
    map['priceProduct'] = priceProduct;
    return map;
  }
}
