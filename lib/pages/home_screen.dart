import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halloween_apple_dev/models/item.dart';
import 'package:halloween_apple_dev/pages/details_page.dart';
import 'package:halloween_apple_dev/widgets/custom_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> _items = itemsList;

  final List<String> _categories = [
    'Attributes',
    'Costumes',
    'Pumpkin',
    'Candies',
    'Tricks',
    'Fears',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
          child: Stack(
            children: [
              // Main Column
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 110.h),
                    _buildHeadline(context),
                    SizedBox(height: 20.h),
                    _buildCategories(context),
                    SizedBox(height: 30.h),
                    Text(
                      'Best Sellers',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    SizedBox(height: 30.h),
                    _buildItemsList(context),
                  ],
                ),
              ),

              // Appbar
              Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildAppbar(context),
                ],
              ),

              // Bottom Navigation Bar
              Column(
                children: [
                  const Spacer(),
                  _buildBottomNavBar(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
      margin: EdgeInsets.only(bottom: 20.w),
      decoration: BoxDecoration(
          color: const Color(0xFF625897),
          borderRadius: BorderRadius.circular(100.w),
          border: Border.all(
            color: Colors.grey.shade500,
            width: 0.3,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavbarButton(
              'assets/icons/home_icon.svg', '', 'Home', true),
          _buildBottomNavbarButton(
              'assets/icons/favorite_icon.svg', '', 'Favorites', false),
          _buildBottomNavbarButton(
              'assets/icons/cart_icon.svg', '', 'Cart', false),
          _buildBottomNavbarButton(
              'assets/icons/user_icon.svg', '', 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildBottomNavbarButton(
      String unSelectedIcon, String selectedIcon, String title, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SvgPicture.asset(
              unSelectedIcon,
              height: 18.w,
              color: Colors.white,
            ),
            if (selected) SizedBox(width: 10.w),
            if (selected)
              Text(title,
                  style: TextStyle(color: Colors.white, fontSize: 17.sp)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsList(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 18.h,
      mainAxisSpacing: 18.h,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _items[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(item: item)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF3b3363),
              borderRadius: BorderRadius.circular(24.w),
            ),
            child: Stack(children: [
              Positioned(
                right: -40.w,
                top: 0,
                child: SizedBox(
                  height: 170.h,
                  width: 170.h,
                  child: Hero(
                    child: Image.asset(item.image, fit: BoxFit.contain),
                    tag: item,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/source_icons_heart.svg',
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontFamily: 'Hantton',
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '\$' + item.price,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1.2 : 1.3),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var category in _categories)
            CategoryItem(
              category: category,
              isSelected: category == _categories[0],
            ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, Sebastien',
          style: TextStyle(
            fontFamily: 'Hantton',
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Trick or treat?',
          style: TextStyle(
            fontFamily: 'Hantton',
            fontSize: 19.sp,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          CustomIconButton(icon: 'assets/icons/menu_icon.svg', callback: () {}),
          const Spacer(),
          CustomIconButton(
            icon: 'assets/icons/shopping_cart.svg',
            hasBadge: true,
            callback: () {},
          ),
          SizedBox(width: 8.w),
          _buildProfilePicture(context),
        ],
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.5.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.3),
        borderRadius: BorderRadius.circular(100.w),
      ),
      child: CircleAvatar(
        radius: 19.w,
        backgroundColor: const Color(0xFFa06dd8),
        child: Image.asset('assets/images/profile.png'),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.category, required this.isSelected})
      : super(key: key);

  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            InkWell(
              borderRadius: isSelected
                  ? BorderRadius.circular(30.w)
                  : BorderRadius.circular(20.w),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 24.w : 15.w,
                  vertical: isSelected ? 16.w : 13.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: isSelected
                      ? BorderRadius.circular(30.w)
                      : BorderRadius.circular(20.w),
                  color:
                      isSelected ? const Color(0xFF353f5e) : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : const Color(0xFF3f385b),
                  ),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: isSelected ? 19.sp : 16.sp,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ),
            ),
            isSelected
                ? Container(
                    height: 4.w,
                    width: 4.w,
                    margin: EdgeInsets.only(top: 7.h, right: 20.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
