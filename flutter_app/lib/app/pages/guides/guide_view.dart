import 'package:emerce_components/RoundedButton.dart';
import 'package:emerce_components/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/constant/animation.dart';
import 'package:flutter_app/app/pages/guides/guide_controller.dart';
import 'package:flutter_app/app/widgets/guide.dart';
import 'package:flutter_app/data/helpers/full_screen_size.dart';
import 'package:flutter_app/data/repo/DataGuideRepository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GuidePages extends View {
  GuidePages({Key key}) : super(key: key);

  @override
  _GuidePagesState createState() => _GuidePagesState();
}

class _GuidePagesState extends ViewState<GuidePages, GuideController> {
  _GuidePagesState() : super(GuideController(DataGuideRepository()));

  @override
  Widget get view {
    return SafeArea(
        child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: ControlledWidgetBuilder<GuideController>(
                      builder: (context, controller) {
                    return PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          controller.currentPage = value;
                        });
                      },
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) => Guide(
                        image: controller.items[index].imgUrl,
                        text: controller.items[index].message,
                      ),
                    );
                  }),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            FullSizeConfig.getProportionateScreenWidth(20)),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        ControlledWidgetBuilder<GuideController>(
                            builder: (context, controller) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => buildDot(
                                  index: index,
                                  currentPage: controller.currentPage),
                            ),
                          );
                        }),
                        Spacer(flex: 3),
                        RoundedButton(
                          text: "Continue",
                          press: () {
                            Navigator.of(context).pushNamed("");
                          },
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  AnimatedContainer buildDot({int index, int currentPage}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
