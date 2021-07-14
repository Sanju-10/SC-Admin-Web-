import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/info_card.dart';


class OverviewCardsMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
                  children: [
                    InfoCard(
                      title: "Orders",
                      value: "7",
                      onTap: () {},
                  topColor: Colors.orange,

                    ),
                    SizedBox(
                      width: _width / 64,
                    ),
                    InfoCard(
                      title: "Revenue",
                      value: "Rs.10000",
                  topColor: Colors.lightGreen,

                      onTap: () {},
                    ),
                  
                  ],
                ),
            SizedBox(
                      height: _width / 64,
                    ),
                  Row(
                  children: [
             
                    InfoCard(
                      title: "Products",
                      value: "10",
                  topColor: Colors.redAccent,

                      onTap: () {},
                    ),
                    SizedBox(
                      width: _width / 64,
                    ),
                    InfoCard(
                      title: "Brands",
                      value: "5",
                      onTap: () {},
                    ),
                
                  ],
                ),
      ],
    );
  }
}