class ProductModel {
  String name, image, description,brand, flavour, servingSize,productId,specialDetails,category;
  int price;

  ProductModel(this.name, this.image, this.brand,this.description, this.flavour, this.servingSize,
      this.price,this.productId,this.specialDetails,this.category);

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    image = map["image"];
    brand = map["brand"];
    description = map["description"];
    flavour = map["flavour"];
    servingSize = map["servingSize"];
    price = map["price"];
    productId = map["productId"];
    price = map["price"];
    specialDetails = map["specialDetails"];
    category=map["Category"];
  }

  toJson() {
    return {
      "name": name,
      "image": image,
      "brand": brand,
      "description": description,
      "flavour": flavour,
      "servingSize": servingSize,
      "price": price,
      "productId": productId,
      "specialDetails": specialDetails,
      "Category":category
    };
  }
}