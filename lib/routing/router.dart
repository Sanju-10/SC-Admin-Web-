import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/Orders/drivers.dart';
import 'package:flutter_web_dashboard/pages/Products/products.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ordersPageRoute:
      return _getPageRoute(OrdersPage());
    case productsPageRoute:
      return _getPageRoute(ProductsPage());
    default:
      return _getPageRoute(OverviewPage());

  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}