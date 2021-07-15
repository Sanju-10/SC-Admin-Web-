import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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


class ProductViewModel extends GetxController{
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);



  ProductViewModel(){
    getProduct();
  }
  //Product Item From Firebase

  getProduct() async{
    _loading.value=true;
    ProductService().getProduct().then((value){
      for(int i=0;i<value.length;i++){
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value=false;
      }
      print(_productModel.length);
      update();

    } );

  }

}

class ProductService{
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProduct() async{
    var value=await _productCollectionRef
        .get();
    return value.docs;

  }
}




