import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/Models/product_model.dart';
import 'package:flutter_web_dashboard/Service/product_service.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class ProductTable extends StatelessWidget {
  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  //Product Item From Firebase

  getProduct() async{
    _loading.value=true;
    ProductService().getProduct().then((value){
      for(int i=0;i<value.length;i++){
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value=false;
      }
      print(_productModel.length);
      // update();

    } );

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child:   DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: MediaQuery.of(context).size.width,
              columns: [
                DataColumn2(
                  label: Text("Name"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Location'),
                ),
                DataColumn(
                  label: Text('Rating'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: []),
    );
  }


  
}
