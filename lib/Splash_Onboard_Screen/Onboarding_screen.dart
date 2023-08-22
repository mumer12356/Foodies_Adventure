import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';

import '../Screen/welcome_screen.dart';
import '../components/constrain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late LiquidController liquidController;
  int currentIndex=0;
  final List<Map<String,dynamic>> splashData=[
    {
      "title": "Welcome to Foodies Adventure",
      "Subtitle": "Embark on a mouthwatering journey through diverse cuisines "
          "and flavors from around the globe. Let your taste buds dance in "
          " delight with Foodies Adventure!",
      "image" : "assets/Animation/First.json",
      "color": const Color(0xFF8CC6FB)
    },
    {
      "title": "Order Delicious Food with Ease",
      "Subtitle": "Say goodbye to long waits and hello to instant gratification. "
          "Foodies Adventure brings you a hassle-free food delivery experience, "
          "delivering scrumptious meals straight to your doorstep",
      "image" : "assets/Animation/second.json",
      "color": const Color(0xFF5F939A)
    },
    {
      "title": "Explore & Experience",
      "Subtitle": "Get ready to explore a world of unique tastes and ingredients."
          " Foodies Adventure empowers you to savor new delicacies and create "
          "unforgettable culinary memories.",
      "image" : "assets/Animation/third.json",
      "color": const Color(0xFFDA6386)
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    liquidController= LiquidController();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    bool isOnboardingCompleted = await getIsOnboardingCompleted();
    if (isOnboardingCompleted) {
      // Onboarding completed, navigate to WelcomeScreen directly
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => WelcomeScreen()),
      // );
    }
  }

  Future<bool> getIsOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOnboardingCompleted') ?? false;
  }

  void _saveOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOnboardingCompleted', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Stack(
        children: [
          LiquidSwipe.builder(
              itemCount: splashData.length,
              itemBuilder: (context,index){
                return getOnBoardingScreen(index);
              },
            positionSlideIcon: 0.8,
            onPageChangeCallback: pageChangeCallBack,
            waveType: WaveType.circularReveal,
            liquidController: liquidController,
            fullTransitionValue: 880,
            ignoreUserGestureWhileAnimating: true,
            enableLoop: true,
              ),
          Padding(
              padding:const EdgeInsets.all(10),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    List.generate(
                        splashData.length,
                            _buildDot),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getOnBoardingScreen(int index) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Flexible(
                child: Lottie.asset(
                    splashData[index]['image'],height: 400)),
          Padding(padding:
          const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(splashData[index]['title'],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontFamily: 'Billy',
                color: DeepPurpleColor,
              ),
              ),
              const SizedBox(height: 20,),
              Text(splashData[index]['Subtitle'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Billy',
                  color: KBlackColor,
                ),
              ),
              const SizedBox(height: 20,),
              ButtonTheme(
                height: 50,
                  minWidth: 150,
                  child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                          return const BorderSide(color: Color(0xFF5545aa)); // Customize the border color and width
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                          return const Color(0xFF5545aa); // Customize the text color
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ),
                      onPressed: (){
                        if(index !=splashData.length -  1){
                          liquidController.jumpToPage(
                              page: splashData.length - 1 );
                        }else{
                          liquidController.jumpToPage(page: 0);
                          _saveOnboardingCompleted();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                          );
                        }


                        },
                      child: Text(
                        index !=splashData.length -  1 ? 'Skip' : 'Get Started',
                        style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'Billy',
                        color: KBlackColor,
                      ),
                      ),
                  ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }

  void pageChangeCallBack(int activePageIndex) {
    setState(() {
      currentIndex=activePageIndex;
    });
  }

  Widget _buildDot(int activePageIndex) {
    double selectedIndex=Curves.easeOut.transform(
        max(0.0, 1.0-((currentIndex)-activePageIndex).abs()));
    double zoom=1.0+ (1.6 - 1.3)*selectedIndex;
    return SizedBox(
      width: 20,
      child: Center(
        child: Material(
          color: const Color(0xFF5545aa),
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0*zoom,
            height: 20.0*zoom,
          ),
        ),
      ),
    );
  }
}
