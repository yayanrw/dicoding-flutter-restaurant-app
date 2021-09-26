class ClsRestaurantDb {
  late int? id;
  late String name;
  late String city;
  late String pictureId;
  late String rating;

  ClsRestaurantDb(
      {this.id,
      required this.name,
      required this.city,
      required this.pictureId,
      required this.rating});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'pictureId': pictureId,
      'rating': rating,
    };
  }

  ClsRestaurantDb.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    city = map['city'];
    pictureId = map['pictureId'];
    rating = map['rating'];
  }
}
