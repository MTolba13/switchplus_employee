class PriceModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text1;
  String? text2;
  String? text3;
  String? text4;
  String? priceimage;

  PriceModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.priceimage,
  });

  PriceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    text1 = json['iPhone 13 128 GB'];
    text2 = json['text2'];
    text3 = json['text3'];
    text4 = json['text4'];
    priceimage = json['Priceimage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'iPhone 13 128 GB': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'Priceimage': priceimage,
    };
  }
}
