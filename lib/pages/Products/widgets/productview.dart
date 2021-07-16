import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/Models/Products/product_model.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/// Example without datasource
class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
      init: Get.put(ProductViewModel()),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                         addProductDialog(context);

                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(25.0),
                          shadowColor: dark,
                          elevation: 10.0,
                          child: Container(
                            padding:EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height*.07,
                            decoration: BoxDecoration(
                              color: light
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.plusCircle,color: dark,),
                                SizedBox(width: 5.0,),
                                CustomText(text: "Add Product",color: dark,)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: active.withOpacity(.4), width: .5),
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
                      child: ResponsiveWidget.isSmallScreen(context)
                          ? _listViewProductSmallScreen()
                          : _listViewProductLargeScreen()),
                ],
              ),
            ),
    );
  }

  Widget _listViewProductSmallScreen() {
    return GetBuilder<ProductViewModel>(
        builder: (controller) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1),
              itemCount: controller.productModel.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.grey.shade100),
                          width: ResponsiveWidget.isSmallScreen(context)
                              ? MediaQuery.of(context).size.width * .6
                              : MediaQuery.of(context).size.width * .2,
                          child: Container(
                              height: MediaQuery.of(context).size.height * .3,
                              child: Image.network(
                                controller.productModel[index].image,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      CustomText(
                        text: controller.productModel[index].name,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomText(
                        text: controller.productModel[index].brand,
                      ),
                      CustomText(
                        text: "LKR " +
                            controller.productModel[index].price.toString(),
                      ),
                    ],
                  ),
                );
              },
            ));
  }

  Widget _listViewProductLargeScreen() {
    return GetBuilder<ProductViewModel>(
        builder: (controller) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1),
              itemCount: controller.productModel.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.grey.shade100),
                            width: ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width * .6
                                : MediaQuery.of(context).size.width * .2,
                            child: Container(
                                height: MediaQuery.of(context).size.height * .3,
                                child: Image.network(
                                  controller.productModel[index].image,
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                        CustomText(
                          text: controller.productModel[index].name,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomText(
                          text: controller.productModel[index].brand,
                        ),
                        CustomText(
                          text: "LKR " +
                              controller.productModel[index].price.toString(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
  }

  void addProductDialog(BuildContext context) =>showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            children: [
              SizedBox(height: 100.0,),
              Text("Test"),
              SizedBox(height: 50.0,),
              Text("Test 2")
            ],
          ),
        );
      });
}
