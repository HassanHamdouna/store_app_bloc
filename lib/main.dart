import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/bloc/bloc/carts_bloc.dart';
import 'package:store_app/bloc/bloc/products_bloc.dart';
import 'package:store_app/bloc/states/crud_state.dart';
import 'package:store_app/database/db_controller.dart';
import 'package:store_app/get/language_getx_controller.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:store_app/utils/context_extenssion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initProvider();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // LanguageGetXController getXController = Get.put<LanguageGetXController>(LanguageGetXController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, widget) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ProductsBloc>(create: (context) => ProductsBloc(LoadingState()),),
              BlocProvider<CartsBloc>(create: (context) => CartsBloc(LoadingState()),),
            ],
            child:  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: context.appThem,
              localizationsDelegates:
              AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale('en'),
              initialRoute: '/launch_screen',
              routes: context.route),
          );
        });
  }
}
