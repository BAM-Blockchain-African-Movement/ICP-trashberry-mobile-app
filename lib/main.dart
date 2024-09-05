import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_berry/utils/app_string.dart';
import 'package:trash_berry/cubit/screen_cubit.dart';
import 'package:trash_berry/views/boarding/onboard.dart';
import 'package:trash_berry/utils/local_cache_manager.dart';
import 'package:trash_berry/views/trashberry/screen_page.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(
    cameras: cameras,
  ));
}

class MyApp extends StatelessWidget {
  List<CameraDescription> cameras;
  MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScreenCubit>(
          create: (_) => ScreenCubit(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        home: HomePage(
          cameras: cameras,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  List<CameraDescription> cameras;
  HomePage({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocalCacheManager.getFlag(name: "onboarding_completed"),
        builder: (context, snapshot) => snapshot.hasData
            ? ScreenPage(
                cameras: cameras,
              )
            : Onboard(
                cameras: cameras,
              ));
  }
}
