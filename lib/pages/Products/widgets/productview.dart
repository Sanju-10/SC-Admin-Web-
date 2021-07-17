import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_web_dashboard/Models/Products/product_model.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'dropped_file.dart';
import 'dropped_image.dart';

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
                        onTap: () {
                          addProductDialog(context);
                        },
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 10.0,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height * .07,
                            decoration: BoxDecoration(color: light),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.plusCircle,
                                  color: dark,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                CustomText(
                                  text: "Add Product",
                                  color: dark,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
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

  void addProductDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(FontAwesomeIcons.windowClose))
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  Dropfile()
                ],
              ),
              Divider(),
              Row(
                children: [
                  Form(
                    key: key,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Street 1
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: TextFormField(
                                    onSaved: (value){
                                      // controller.street1=value;
                                    },
                                    validator: (String value){
                                      if(value.isEmpty){
                                        return "Street 1 is a required field";
                                      }
                                    },
                                    // labelText: "Street 1",
                                    // hint: "Type Street Address 1",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //Street 2
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: TextFormField(
                                    onSaved: (value){
                                      // controller.street2=value;
                                    },
                                    // labelText: "Street 2",
                                    // hint: "Type Your Street 2 Address",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //City/Town
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: TextFormField(
                                    onSaved: (value){
                                      // controller.city=value;
                                    },
                                    validator: (String value){
                                      if(value.isEmpty){
                                        return "City/Town is a required field";
                                      }
                                    },
                                    // labelText: "City/Town",
                                    // hint: "Type your City/Town",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //Phone Number
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20.0)),
                                width: Get.width,
                                child: Row(
                                  children: [
                                    //Town
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 18.0),
                                        child: TextFormField(
                                          onSaved: (value){
                                            // controller.phoneNumber1=value;
                                          },
                                          validator: (String value){
                                            if(value.isEmpty){
                                              return "Phone is a required field";
                                            }
                                          },
                                          // labelText: "Phone Number 1",
                                          // hint: "Enter Your Phone",
                                        ),
                                      ),
                                    ),

                                    //Phone Number
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 18.0),
                                        child: TextFormField(
                                          onSaved: (value){
                                            // controller.phoneNumber2=value;
                                          },
                                          // labelText: "Phone Number 2",
                                          // hint: "Enter Your Phone",
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}

class Dropfile extends StatefulWidget {
  const Dropfile({Key key}) : super(key: key);

  @override
  _DropfileState createState() => _DropfileState();
}

class _DropfileState extends State<Dropfile> {
  DroppedFile file;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DroppedFileWidget(
          file: file,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 240,
          width: 240,
          child: DropZoneWidget(
            onDroppedFile: (file) => setState(() => this.file = file),
          ),
        ),
      ],
    );
  }
}

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;
  const DropZoneWidget({Key key, this.onDroppedFile}) : super(key: key);

  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  DropzoneViewController controller;
  bool isHighlighted=false;

  @override
  Widget build(BuildContext context) {
    final colorButton = isHighlighted?Colors.blue.shade300:Colors.green.shade300;
    final colorBackground=isHighlighted?Colors.blue:Colors.green;
    return buildDecoration(
      child: Stack(children: [
        DropzoneView(
          onDrop: acceptFile,
          onCreated: (controller) => this.controller = controller,
          onHover: ()=>setState(()=>isHighlighted=true),
          onLeave: ()=>setState(()=>isHighlighted=false),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload,
                size: 40,
                color: light,
              ),
              CustomText(
                text: "Drop Files here",
                color: light,
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0,
                    ),
                    primary: colorButton,
                    shape: RoundedRectangleBorder()),
                onPressed: () async {
                  final events = await controller.pickFiles();

                  if (events.isEmpty) return;

                  acceptFile(events.first);
                },
                label: CustomText(
                  text: "Choose Files",
                  color: light,
                ),
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    final droppedFile =
        DroppedFile(url: url, name: name, mime: mime, bytes: bytes);

    widget.onDroppedFile(droppedFile);
    setState(()=>isHighlighted=false);
  }

  Widget buildDecoration({Widget child}) {
    final colorBackground=isHighlighted?Colors.blue:Colors.green;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: colorBackground,
        padding: EdgeInsets.all(10),
        child:DottedBorder(
            borderType:BorderType.RRect,
            color:Colors.white,
            padding:EdgeInsets.zero,
            strokeWidth: 3,
            radius: Radius.circular(10),
            dashPattern: [8,4],
            child: child) ,
      ),
    );
  }
}
