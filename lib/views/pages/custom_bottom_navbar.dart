import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/app_assests.dart';
import '../../utils/app_colors.dart';
import '../../utils/route/app_routes.dart';
import '../../view_models/cart_cubit/cart_cubit.dart';
import '../../view_models/favorite_cubit/favorite_cubit.dart';
import 'cart_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late PersistentTabController _controller;

  int _currntIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _controller.addListener(() {
      setState(() {
        _currntIndex = _controller.index;
      });
    });
    //  sendDummyData();
  }

  // Future<void> sendDummyData() async {
  //   dummyProducts.forEach((product) async {
  //     await _firestoreService.setData(
  //         path: ApiPaths.product(product.id), data: product.toMap());
  //   });
  // }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
     BlocProvider(
  create: (context) => FavoriteCubit(), 
  child: FavoritePage(),
),

        BlocProvider(
        create: (context) {
          final cubit = CartCubit();
          cubit.getCartItems();
          return cubit;
        },
        child: const CartPage(),
      ),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.home_max_outlined),
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.Primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.favorite_border),
        icon: const Icon(Icons.favorite),
        title: ("Favorites"),
        activeColorPrimary: AppColors.Primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.shopping_cart_checkout_outlined),
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: AppColors.Primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.person_2_outlined),
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: AppColors.Primary,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(AppAssets.userImage),
          ),
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("hi lojain",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          Text("Let's Go Shopping!",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.grey))
        ]),
        actions: [
          if (_currntIndex == 0) ...[
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_on_outlined)),
          ] else if (_currntIndex == 2) ...[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.myOrders);
              },
              icon: const Icon(Icons.card_travel_outlined),
              label: const Text("Checkout"),
            ),
          ]
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        stateManagement: false,
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }
}
