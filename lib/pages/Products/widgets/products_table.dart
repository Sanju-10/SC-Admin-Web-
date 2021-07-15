import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/Models/Products/product_model.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:get/get.dart';

/// Example without datasource
class ProductTable extends StatelessWidget {
  final columns = [
    // "Product Id",
    "Product Name", "Price", "Brand", "Category", "Flavour", "Serving Size",
    "Image", "Short Description", "Description",
  ];
  List<ProductModel> productsList = [];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
      init: Get.put(ProductViewModel()),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
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
              child: _listViewProduct()),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getRows(List<ProductModel> products) =>
      products.map((ProductModel productModel) {
        final cells = [
          // productModel.productId,
          productModel.name,
          productModel.price,
          productModel.brand,
          productModel.category,
          productModel.flavour,
          productModel.servingSize,
          productModel.image,
          productModel.specialDetails,
          productModel.description,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  Widget _listViewProduct() {
    return GetBuilder<ProductViewModel>(
      builder: (controller) => Container(
        height: 350.0,
        child: ListView.separated(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return DataTable(
                columns: getColumns(columns),
                rows: getRows(controller.productModel));
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 10.0,
          ),
        ),
      ),
    );
  }
}
