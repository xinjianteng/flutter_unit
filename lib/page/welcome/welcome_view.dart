import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unit/page/welcome/unit_paint.dart';
import 'package:get/get.dart';

import '../../common/routers/routes.dart';
import '../../common/style/style.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'welcome_logic.dart';
import 'welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  final WelcomeLogic logic = Get.put(WelcomeLogic());
  final WelcomeState state = Get
      .find<WelcomeLogic>()
      .state;

  late AnimationController _controller;

  final Duration animTime = const Duration(milliseconds: 600);
  final Duration delayTime = const Duration(milliseconds: 500);

  late Animation<Offset> logoOffsetAnim;
  late Animation<Offset> headOffsetAnim;
  late Animation<double> logoScaleAnim;

  late UnitPainter unitPainter = UnitPainter(repaint: _controller);

  @override
  void initState() {
    super.initState();

    SystemUiOverlayStyle systemUiOverlayStyle =
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    _controller = AnimationController(duration: animTime, vsync: this)
      ..addStatusListener(_listenStatus)
      ..forward();

    initAnimation();

    Future.delayed(delayTime).then((e) {
      logic.state.visible.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //返回拦截控件
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AColors.primaryBackground,
        body: Stack(
          alignment: Alignment.center,
          children: [
            _buildFlutterLogo(),
            CustomPaint(painter: unitPainter, size: Dimens.getSize()),
            _buildFlutterUnitText(),
            _buildHead(),
            Positioned(
              bottom: Dimens.getHeight(15),
              child: _buildAuthorText(),
            )
          ],
        ),
      ),
      onWillPop: () => _willPop(context),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<WelcomeLogic>();
    super.dispose();
  }

  Future<bool> _willPop(BuildContext context) async {
    return false;
  }

  void _listenStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(delayTime).then((e) {
        Get.offAndToNamed(AppRoutes.application);
      });
    }
  }

  void initAnimation() {
    logoOffsetAnim = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.5),
    ).animate(_controller);

    headOffsetAnim = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(-5, -5),
    ).animate(_controller);

    logoScaleAnim = Tween(
      begin: 2.0,
      end: 1.0,
    ).animate(_controller);
  }

  Widget _buildFlutterLogo() {
    //滑动变换
    return SlideTransition(
      textDirection: TextDirection.ltr,
      position: logoOffsetAnim,
      child: RotationTransition(
        //旋转变换
        turns: _controller,
        child: ScaleTransition(
          scale: logoScaleAnim,
          child: FadeTransition(
            opacity: _controller,
            child: SizedBox(
              height: Dimens.getHeight(120),
              child: FlutterLogo(
                size: Dimens.getHeight(60),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHead() {
    return SlideTransition(
      position: headOffsetAnim,
      child: Image.asset(
        ImagePathUtils.wrapAssets("icon_head.webp"),
        width: Dimens.getWidth(60),
        height: Dimens.getHeight(60),
      ),
    );
  }

  Widget _buildFlutterUnitText() {
    return Positioned(
      top: Dimens.getSHeight() / 1.4,
      child: Obx(() {
        return Visibility(
          child: FlutterUnitText(
            text: AStrings.appName,
            color: AColors.primaryText,
          ),
          visible: logic.state.visible.value,
        );
      }),
    );
  }

  Widget _buildAuthorText() {
    return Obx(() {
      return AnimatedOpacity(
          duration: animTime,
          opacity: logic.state.visible.value ? 1.0 : 0.0,
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              Text(AStrings.appAuthor, style: TextStyleUnit.splashShadows),
              Text(AStrings.appVersion, style: TextStyleUnit.splashShadows),
            ],
          ));
    });
  }
}
