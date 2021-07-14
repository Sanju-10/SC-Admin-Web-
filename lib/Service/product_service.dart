import 'package:cloud_firestore/cloud_firestore.dart';


class ProductService {
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');


  Future<List<QueryDocumentSnapshot>> getProduct() async{
    var value=await _productCollectionRef
        .get();
    return value.docs;

  }

}