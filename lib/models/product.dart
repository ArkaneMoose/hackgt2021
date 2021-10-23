import 'package:flutter/material.dart';
import 'package:hackgt2021/api/ncr.dart';

class Product {
  final String image, title, description;
  final double price;
  final int size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });

  static Future<Product> fromId(String id) async {
    final responses = await Future.wait([
      Ncr.get('https://gateway-staging.ncrcloud.com/catalog/items/$id'),
      Ncr.get(
          'https://gateway-staging.ncrcloud.com/catalog/item-prices/$id/$id',
          headers: {
            'nep-enterprise-unit': '4284bf294fad4e1399c26861bf25ff52',
          }),
    ]);
    final product = responses[0];
    final price = responses[1]['price'] as double;
    final attributes = (product['dynamicAttributes'] as List<dynamic>);
    final parsedId = int.parse(product['itemId']['itemCode']);
    final title = product['shortDescription']['values']
            .firstWhere((element) => element['locale'] == 'en-US')['value']
        as String;
    final image = (attributes.firstWhere(
                (element) => element['type'] == 'image')['attributes']
            as List<dynamic>)
        .firstWhere((element) => element['key'] == 'path')['value'] as String;
    final color = Color(int.parse(
            ((attributes.firstWhere((element) => element['type'] == 'color')[
                            'attributes'] as List<dynamic>)
                        .firstWhere(
                            (element) => element['key'] == 'primary')['value']
                    as String)
                .substring(1, 7),
            radix: 16) |
        0xFF000000);

    return Product(
      color: color,
      description: dummyText,
      id: parsedId,
      image: image,
      price: price,
      size: 0,
      title: title,
    );
  }
}

List<Product> products = [
  Product(
      id: 1,
      title: "Sweet Baby Ray's BBQ Sauce",
      price: 249,
      size: 12,
      description: dummyText,
      image: "assets/images/bbq-sauce.png",
      color: const Color(0xFF302625)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: const Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley. \n Orangutan orange lorem ipsum eat banana hardpoint LA ipsum lorem eat more elepahant";
