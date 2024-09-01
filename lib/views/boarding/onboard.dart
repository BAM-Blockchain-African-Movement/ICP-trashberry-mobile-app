import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:trash_berry/utils/colors.dart';
import 'package:trash_berry/utils/app_string.dart';
import 'package:trash_berry/utils/asset_manager.dart';
import 'package:trash_berry/utils/mediaquery_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//import 'package:flutter_gif/flutter_gif.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  int _pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: PageView(
              onPageChanged: (value) => setState(() {
                _pageIndex = value;
              }),
              controller: _pageController,
              children: [
                PageDetail(
                  context: context,
                  image: AppImage.onboard1,
                  title: AppStrings.boarding1[0],
                  text: AppStrings.boarding1[1],
                ),
                PageDetail(
                    context: context,
                    image: AppImage.onboard2,
                    title: AppStrings.boarding2[0],
                    text: AppStrings.boarding2[1]),
                PageDetail(
                  context: context,
                  image: AppImage.onboard3,
                  title: AppStrings.boarding3[0],
                  text: AppStrings.boarding3[1],
                  button: button(context, sWidth),
                ),
              ],
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _pageIndex > 0 ? true : false,
                  child: InkWell(
                    onTap: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    child: const SizedBox(
                      width: 55,
                      child: Text("prev"),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  effect: WormEffect(
                      activeDotColor: AppColors.dark,
                      spacing: 10,
                      type: WormType.normal),
                  controller: _pageController,
                  count: 3,
                  onDotClicked: (index) {
                    if (index > _pageIndex) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    } else {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }
                  },
                ),
                Visibility(
                  visible: _pageIndex < 2 ? true : false,
                  child: InkWell(
                    onTap: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    child: const SizedBox(
                      width: 55,
                      child: Text("next"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton button(BuildContext context, double sWidth) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const Login()),
        // );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        minimumSize: Size(
          sWidth * 0.6,
          60.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Lets Go',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

Widget PageDetail(
    {required BuildContext context,
    required String image,
    required String title,
    required String text,
    Widget? button}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, context.height * 0, 0, context.width * 0.3),
    child: SizedBox(
      //color: Colors.grey,
      width: context.width,
      height: context.width * 0.48,
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, context.width * 0.2, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.5,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              SizedBox(
                height: context.height * 0.05,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark,
                        fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: SizedBox(
                  height: context.height * 0.06,
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              button ?? const SizedBox()
            ],
          ),
        ),
      ),
    ),
  );
}
