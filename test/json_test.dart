// ignore_for_file: always_specify_types

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';

Map<String, Object> testRestaurant = {
  'id': '02hfwn4bh8uzkfw1e867',
  'name': 'Manis Asam Kafe',
  'description': '''
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.''',
  'city': 'Malang',
  'address': 'Jln. Pustakawan no 9',
  'pictureId': '21',
  'rating': 4.6,
  'categories': [
    {'name': 'Spanyol'},
    {'name': 'Sop'}
  ],
  'menus': {
    'foods': [
      {'name': 'Paket rosemary'},
      {'name': 'Salad lengkeng'},
      {'name': 'Tumis leek'},
      {'name': 'Bebek crepes'}
    ],
    'drinks': [
      {'name': 'Jus alpukat'},
      {'name': 'Sirup'},
      {'name': 'Es krim'},
      {'name': 'Jus tomat'},
      {'name': 'Kopi espresso'}
    ]
  },
  'customerReviews': [
    {'name': 'Arif', 'review': 'Tidak ada duanya!', 'date': '13 November 2019'},
    {
      'name': 'Widdy',
      'review': 'Tempatnya bagus namun menurut saya masih sedikit mahal.',
      'date': '14 Agustus 2018'
    },
    {
      'name': 'Ahmad',
      'review': 'Saya sangat suka menu malamnya!',
      'date': '14 Agustus 2018'
    }
  ]
};
void main() {
  test('Test Parsing', () async {
    final result = RestaurantModel.fromJson(testRestaurant).id;

    expect(result, '02hfwn4bh8uzkfw1e867');
  });
}
