import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_berry/cubit/screen_cubit.dart';
import 'package:trash_berry/views/boarding/onboard.dart';
import 'package:trash_berry/utils/mediaquery_manager.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    final screenCubit = BlocProvider.of<ScreenCubit>(context);
    final imagesList = screenCubit.state;
    return Scaffold(
      body: SizedBox(
        width: context.width * 0.5,
        height: context.height * 0.3,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: imagesList?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: context.width * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: context.width * 0.05,
                    height: context.height * 0.1,
                    child: Image(
                      opacity: const AlwaysStoppedAnimation(07),
                      image: FileImage(
                        File(imagesList![index].path),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
