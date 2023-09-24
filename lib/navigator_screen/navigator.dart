import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/home_screen/home_screen.dart';
import 'package:smart/light_screen/light_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  NavigatorScreenState createState() => NavigatorScreenState();
}

class NavigatorScreenState extends State<NavigatorScreen>
    with TickerProviderStateMixin {
  Color mainColor = const Color(0xfD16181D);
  late String? username;
  late Uint8List? profile;
  late List<Widget> _children;
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  // 플로팅 버튼이 위치할 위치를 지정합니다.
  final double fabBottomMargin = 16.0;

  // 키보드가 올라올 때 플로팅 버튼의 위치를 조정합니다.
  double? _fabTopMargin;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _children = [
      const HomeScreen(),
      const LightScreen(),
      const LightScreen(),
      const LightScreen(),
    ];

    Widget fadeZoomTransition(Widget child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.0).animate(_animationController),
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            child: child,
          ),
        ),
      );
    }

    Widget iconButton(String icon, int index) {
      return IconButton(
        iconSize: 40,
        icon: SvgPicture.asset(
          'assets/images/$icon.svg',
          colorFilter: ColorFilter.mode(
              _currentIndex == index ? Colors.white : Colors.grey, BlendMode.srcIn),
        ),
        onPressed: () {
          _onTap(index);
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _children.map((e) => fadeZoomTransition(e)).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.08,
        color: mainColor,
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              _buildNavItem('home', 0, 32),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              _buildNavItem('temp', 1, 28),
              SizedBox(width: MediaQuery.of(context).size.width * 0.30),
              _buildNavItem('lights', 2, 26),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              _buildNavItem('home', 3, 32),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: MyElevatedButton(
          backgroundColor: mainColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          onPressed: () {
          },
          borderRadius: BorderRadius.circular(100),
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(String icon, int index, double iconSize) {
    return GestureDetector(
      onTap: () => _onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: SvgPicture.asset(
              'assets/images/$icon.svg',
              colorFilter: ColorFilter.mode(
                  _currentIndex == index ? Colors.white : Colors.grey, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      _animationController.forward(from: 0.0);
      pageController.jumpToPage(index);
    }
  }
}