import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_unit/common/langs/translation_service.dart';
import 'package:flutter_unit/common/routers/pages.dart';
import 'package:flutter_unit/global.dart';

import 'common/store/store.dart';
import 'common/style/style.dart';
import 'common/utils/logger_utils.dart';
import 'common/values/values.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        Dimens.width,
        Dimens.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => RefreshConfiguration(
        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        headerBuilder: () => const ClassicHeader(),
        // 配置默认底部指示器
        footerBuilder: () => const ClassicFooter(),
        // Viewport不满一屏时,禁用上拉加载更多功能
        hideFooterWhenNotFull: true,
        // 头部触发刷新的越界距离
        headerTriggerDistance: 80,
        //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxOverScrollExtent: 100,
        // 尾部触发刷新的越界距离
        footerTriggerDistance: 150,
        // 底部最大可以拖动的范围
        maxUnderScrollExtent: 0,
        //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableScrollWhenRefreshCompleted: true,
        //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        enableLoadingWhenFailed: true,
        // 可以通过惯性滑动触发加载更多
        enableBallisticLoad: true,
        child: GetMaterialApp(
          title: AStrings.appName,
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
          translations: TranslationService(),
          navigatorObservers: [AppPages.observer],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: ConfigStore.to.languages,
          locale: ConfigStore.to.locale,
          fallbackLocale: const Locale('en', 'US'),
          enableLog: true,
          logWriterCallback: Logger.write,
        ),
      ),
    );
  }
}
