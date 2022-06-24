import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/global_init.dart';

void main() async {
  // import app
  WidgetsFlutterBinding.ensureInitialized();
  // app init
  await UtilGlobalInit.init();
  // create page
  runApp(const PlugRoot());
}

class PlugRoot extends StatelessWidget {
  const PlugRoot({Key? key, this.initRoute}) : super(key: key);
  final String? initRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // 统一设计尺寸
        designSize: const Size(750, 1334),
        builder: () => GetMaterialApp(
          // GetX
          theme: appTheme.theme,
          initialRoute: initRoute ?? PlugRoutesNames.start,
          getPages: PlugPages.routes,
          builder: EasyLoading.init(),
          defaultTransition: Transition.native,
          transitionDuration: const Duration(milliseconds: 300),
          translations: plugTranslation.translations,
          debugShowCheckedModeBanner: !Env.envConfig.isRelease,
          // 全局翻译
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: plugTranslation.localList,
          locale: plugTranslation.nowLocale.value,
          fallbackLocale: plugTranslation.fallbackLocale.value,
          enableLog: !Env.envConfig.isRelease,
        ),
      );
  }
}