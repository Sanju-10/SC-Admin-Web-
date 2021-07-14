const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const ordersPageDisplayName = "Orders";
const ordersPageRoute = "/orders";

const productsPageDisplayName = "Products";
const productsPageRoute = "/products";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(ordersPageDisplayName, ordersPageRoute),
 MenuItem(productsPageDisplayName, productsPageRoute),
 MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
