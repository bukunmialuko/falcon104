import 'package:falcon104/widgets/onboarding_feature.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  Row _buildIndicatorView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPageView(),
              _buildIndicatorView(),
            ],
          )),
        ),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: FlatButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF100537),
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildPageView() {
    return Container(
      height: 500,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          OnBoardingFeature(
            assetImage: AssetImage(
              'assets/images/onboarding0.png',
            ),
            title: "Order",
            subTitle:
                "Select wide range of products from our categories of Products",
          ),
          OnBoardingFeature(
            assetImage: AssetImage(
              'assets/images/onboarding1.png',
            ),
            title: "Make Payment",
            subTitle:
                "Make payment as per your convience online or on delivery",
          ),
          OnBoardingFeature(
            assetImage: AssetImage(
              'assets/images/onboarding2.png',
            ),
            title: "Delivery",
            subTitle:
                "Fast door step deliveries our delivery person will deliver your order in under 24 hours",
          ),
        ],
      ),
    );
  }
}
