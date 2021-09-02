import 'dart:convert';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class RestaurantRestaurantsMenusDrinks {
/*
{
  "name": "Es krim"
} 
*/

  String? name;

  RestaurantRestaurantsMenusDrinks({
    this.name,
  });
  RestaurantRestaurantsMenusDrinks.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    return data;
  }
}

class RestaurantRestaurantsMenusFoods {
/*
{
  "name": "Paket rosemary"
} 
*/

  String? name;

  RestaurantRestaurantsMenusFoods({
    this.name,
  });
  RestaurantRestaurantsMenusFoods.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    return data;
  }
}

class RestaurantRestaurantsMenus {
/*
{
  "foods": [
    {
      "name": "Paket rosemary"
    }
  ],
  "drinks": [
    {
      "name": "Es krim"
    }
  ]
} 
*/

  List<RestaurantRestaurantsMenusFoods?>? foods;
  List<RestaurantRestaurantsMenusDrinks?>? drinks;

  RestaurantRestaurantsMenus({
    this.foods,
    this.drinks,
  });
  RestaurantRestaurantsMenus.fromJson(Map<String, dynamic> json) {
    if (json["foods"] != null) {
      final v = json["foods"];
      final arr0 = <RestaurantRestaurantsMenusFoods>[];
      v.forEach((v) {
        arr0.add(RestaurantRestaurantsMenusFoods.fromJson(v));
      });
      foods = arr0;
    }
    if (json["drinks"] != null) {
      final v = json["drinks"];
      final arr0 = <RestaurantRestaurantsMenusDrinks>[];
      v.forEach((v) {
        arr0.add(RestaurantRestaurantsMenusDrinks.fromJson(v));
      });
      drinks = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (foods != null) {
      final v = foods;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["foods"] = arr0;
    }
    if (drinks != null) {
      final v = drinks;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["drinks"] = arr0;
    }
    return data;
  }
}

class RestaurantRestaurants {
/*
{
  "id": "rqdv5juczeskfw1e867",
  "name": "Melting Pot",
  "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
  "pictureId": "https://restaurant-api.dicoding.dev/images/medium/14",
  "city": "Medan",
  "rating": 4.2,
  "menus": {
    "foods": [
      {
        "name": "Paket rosemary"
      }
    ],
    "drinks": [
      {
        "name": "Es krim"
      }
    ]
  }
} 
*/

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  RestaurantRestaurantsMenus? menus;

  RestaurantRestaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });
  RestaurantRestaurants.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    name = json["name"]?.toString();
    description = json["description"]?.toString();
    pictureId = json["pictureId"]?.toString();
    city = json["city"]?.toString();
    rating = json["rating"]?.toDouble();
    menus = (json["menus"] != null)
        ? RestaurantRestaurantsMenus.fromJson(json["menus"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["pictureId"] = pictureId;
    data["city"] = city;
    data["rating"] = rating;
    if (menus != null) {
      data["menus"] = menus!.toJson();
    }
    return data;
  }
}

class Restaurant {
/*
{
  "restaurants": [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
      "pictureId": "https://restaurant-api.dicoding.dev/images/medium/14",
      "city": "Medan",
      "rating": 4.2,
      "menus": {
        "foods": [
          {
            "name": "Paket rosemary"
          }
        ],
        "drinks": [
          {
            "name": "Es krim"
          }
        ]
      }
    }
  ]
} 
*/

  List<RestaurantRestaurants?>? restaurants;

  Restaurant({
    this.restaurants,
  });
  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json["restaurants"] != null) {
      final v = json["restaurants"];
      final arr0 = <RestaurantRestaurants>[];
      v.forEach((v) {
        arr0.add(RestaurantRestaurants.fromJson(v));
      });
      restaurants = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (restaurants != null) {
      final v = restaurants;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["restaurants"] = arr0;
    }
    return data;
  }
}

List<RestaurantRestaurants> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => RestaurantRestaurants.fromJson(json)).toList();
}