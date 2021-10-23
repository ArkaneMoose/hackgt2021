import 'package:flutter/material.dart';

class Store {
  final String name, address, description, imageUrl, type;
  final Color color;
  Store({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.description,
    required this.color,
    required this.type,
  });
}

//---------------- FOOD
List<Store> food_sitdine = [
  Store(
    name: "Poor Calvin's",
    address: "10 Piedmont Ave NE, Atlanta, GA 30308",
    imageUrl:
        "https://popmenucloud.com/cdn-cgi/image/width=412,height=412,fit=scale-down,format=auto,quality=60/wghmzerj/741ef693-c091-420a-bd8d-78adeefa7d00.jpg",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'food',
  ),
  Store(
    name: "Touch Indian Cuisine",
    address: "420 14th St NW, Atlanta, GA 30318",
    imageUrl:
        "https://cdn.tasteatlas.com/images/toplistarticles/d0e6a0a79d5f4197a51f4ca065393ffe.jpg",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'food',
  ),
  Store(
    name: "North Avenue Dining",
    address: "120 North Avenue NW, Atlanta, GA 30313",
    imageUrl:
        "https://d3mvlb3hz2g78.cloudfront.net/wp-content/uploads/2012/10/thumb_720_450_784.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'food',
  ),
];

List<Store> food_fast = [
  Store(
    name: "McDonald's",
    address: "1105 Northside Dr NW, Atlanta, GA 30318",
    imageUrl:
        "https://i1.wp.com/www.eatthis.com/wp-content/uploads/2020/07/mcdonalds-1.jpg",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'food',
  ),
  Store(
    name: "Cook Out",
    address: "1112 Northside Dr NW, Atlanta, GA 30318",
    imageUrl:
        "https://hips.hearstapps.com/del.h-cdn.co/assets/17/30/768x384/landscape-1501260005-delish-cookout-burgers-facebook.jpg",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'food',
  ),
  Store(
    name: "Chick-fil-A",
    address: "350 Ferst Dr, Atlanta, GA 30332",
    imageUrl:
        "https://thechickenwire.chick-fil-a.com/-/media/amazon-cloudfront/images/cfacom/stories-images/2020/contactless-ordering/header.ashx?h=960&w=1440&la=en&hash=4A2BE10BB3B9E5A12FADCA5443C13B42",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'food',
  ),
];

List<Store> food_delivery = [
  Store(
    name: "Hattie B's",
    address: "299 Moreland Ave NE, Atlanta, GA 30307",
    imageUrl:
        "https://www.qsrmagazine.com/sites/default/files/styles/story_page/public/slideshow-images/slides/hattiebstendersandsides.jpg",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'food',
  ),
  Store(
    name: "Zunzi's",
    address: "1971 Howell Mill Rd, Atlanta, GA 30318",
    imageUrl:
        "https://images.getbento.com/accounts/95304610a2a23d43ca7018c8683ca30f/media/images/32241Zunzis072.jpg",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'food',
  ),
  Store(
    name: "Desta Ethiopian",
    address: "3086 Briarcliff Rd NE, Atlanta, GA 30329",
    imageUrl:
        "https://cdn.vox-cdn.com/thumbor/U-dWon6ail73B7pjMCJfjRpYI_Y=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13618082/15138414_1332280556795718_4352683764446552990_o.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'food',
  ),
];

//---------------- GROCERY
List<Store> grocery_mp = [
  Store(
    name: "Publix",
    address: "595 Piedmont Ave NE, Atlanta, GA 30308",
    imageUrl:
        "https://cutpcdnwimages.azureedge.net/images/static/StoreFront/001544-828x498.png",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'grocery',
  ),
  Store(
    name: "Kroger",
    address: "725 Ponce De Leon Ave NE, Atlanta, GA 30306",
    imageUrl:
        "https://i1.wp.com/www.eatthis.com/wp-content/uploads/2020/05/kroger.jpg?fit=1200%2C879&ssl=1",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'grocery',
  ),
  Store(
    name: "Walgreens",
    address: "595 Piedmont Ave NE Ste 100, Atlanta, GA 30308",
    imageUrl:
        "https://images.markets.businessinsider.com/image/5f070e541918241b5b131d5a",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'grocery',
  ),
];

List<Store> grocery_wholesale = [
  Store(
    name: "Costco",
    address: "500 Brookhaven Ave, Atlanta, GA 30319",
    imageUrl:
        "https://www.costco.com/wcsstore/CostcoUSBCCatalogAssetStore/feature-pages/18w1411-costco-warehouse.jpg",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'grocery',
  ),
  Store(
    name: "Sam's Club",
    address: "2901 Clairmont Rd, Atlanta, GA 30329",
    imageUrl:
        "https://www.homeworldbusiness.com/wp-content/uploads/2017/11/sams-club-new.jpg",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'grocery',
  ),
  Store(
    name: "Whole Foods",
    address: "650 Ponce De Leon Ave NE, Atlanta, GA 30308",
    imageUrl:
        "https://imgs.6sqft.com/wp-content/uploads/2016/05/03102723/Whole-Foods-Market.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'grocery',
  ),
];

List<Store> grocery_int = [
  Store(
    name: "Patel Brothers",
    address: "1709 Church St F, Decatur, GA 30033",
    imageUrl:
        "https://3.bp.blogspot.com/-ET0WKep71VE/WdVMkrzwMKI/AAAAAAAAMkc/MgyRLfDB-J4bUnQADrm4hgMMLIb35WTRACLcBGAs/s1600/Patel-Brothers-Patel-Plaza.jpg",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'grocery',
  ),
  Store(
    name: "Suvidha",
    address: "2821 Chastain Meadows Pkwy NW #120, Marietta, GA 30066",
    imageUrl:
        "https://scontent-atl3-1.xx.fbcdn.net/v/t31.0-8/11816352_1037735852905588_6622012228246184041_o.jpg?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=16FSuBRaMY4AX_UUPfF&_nc_ht=scontent-atl3-1.xx&oh=96d3567b2af5904a154733b48eb7c44e&oe=5FB18C7C",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'grocery',
  ),
  Store(
    name: "Cherians",
    address: "751 Dekalb Industrial Way Building #4, Decatur, GA 30033",
    imageUrl:
        "https://cdn.powered-by-nitrosell.com/store_images/16/3925/image_carousel/BeansLentils.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'grocery',
  ),
];

//---------------- RETAIL
List<Store> retail_tech = [
  Store(
    name: "Apple",
    address: "3393 Peachtree Rd NE, Atlanta, GA 30326",
    imageUrl: "https://www.apple.com/retail/eton/images/hero_large_2x.jpg",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'retail',
  ),
  Store(
    name: "Best Buy",
    address: "2537 Piedmont Rd NE, Atlanta, GA 30324",
    imageUrl:
        "https://i1.wp.com/digiday.com/wp-content/uploads/2017/07/Best-Buy.jpg?fit=1440%2C600&ssl=1",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'retail',
  ),
  Store(
    name: "GameStop",
    address: "1801 Howell Mill Rd NW #550, Atlanta, GA 30318",
    imageUrl:
        "https://media.wired.com/photos/5e73e37dd036ef00088bfb87/125:94/w_2375,h_1786,c_limit/Gear-Gamestop-693469182.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'retail',
  ),
];

List<Store> retail_general = [
  Store(
    name: "Walmart",
    address: "835 M.L.K. Jr Dr NW, Atlanta, GA 30314",
    imageUrl:
        "https://www.supermarketnews.com/sites/supermarketnews.com/files/styles/article_featured_retina/public/Walmart_Canada_supercenter_exterior.png",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'retail',
  ),
  Store(
    name: "Target",
    address: "375 18th St NW, Atlanta, GA 30363",
    imageUrl:
        "https://cdn.cheapism.com/images/Top_Selling_Items_at_Target.max-800x600.png",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'retail',
  ),
  Store(
    name: "Kohl's",
    address: "1825 East-West Connector, Austell, GA 30106",
    imageUrl:
        "https://www.gannett-cdn.com/presto/2020/03/31/PMJS/80143b10-9f74-4d6d-9f5f-649c99df615a-MJS_coronavirus_KOHLS_04_wood_corona_SUPPLIES.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'retail',
  ),
];

List<Store> retail_home = [
  Store(
    name: "IKEA",
    address: "441 16th St NW, Atlanta, GA 30363",
    imageUrl: "https://images.wsj.net/im-193674?width=1280&size=1",
    description: dummyText,
    color: const Color(0xFF3D82AE),
    type: 'retail',
  ),
  Store(
    name: "Home Depot",
    address: "650 Ponce De Leon Ave NE, Atlanta, GA 30308",
    imageUrl:
        "https://www.thebalancesmb.com/thmb/QwfOKUuRIiZKpd3H0KYqk3X0LvA=/3000x1687/smart/filters:no_upscale()/home-depot-2016308-5b848f5b46e0fb00258d090d.jpg",
    description: dummyText,
    color: const Color(0xFFD3A984),
    type: 'retail',
  ),
  Store(
    name: "Lowe's",
    address: "1280 Caroline St NE, Atlanta, GA 30307",
    imageUrl:
        "https://www.pymnts.com/wp-content/uploads/2020/05/lowes-earnings-retail-home-improvement.jpg",
    description: dummyText,
    color: const Color(0xFF989493),
    type: 'retail',
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
