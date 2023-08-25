import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import '../../Screen/welcome_screen.dart';
import '../../components/constrain.dart';
import 'List_of_data.dart';
import 'Onboarding_Dots.dart';
import 'void_on-boardinding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late LiquidController liquidController;
   int currentIndex=0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    liquidController= LiquidController();
    checkOnboarding();
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
                            buildDot),
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
                          return  BorderSide(color: OnboardPurple); // Customize the border color and width
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                          return  (OnboardPurple); // Customize the text color
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
                          saveOnboardingCompleted();
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
}
