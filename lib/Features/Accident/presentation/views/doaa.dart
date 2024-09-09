import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_cubit.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/doaa_item.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/doaa_navigation.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class Doaa extends StatefulWidget {
  const Doaa({super.key});

  @override
  State<Doaa> createState() => _DoaaState();
}

class _DoaaState extends State<Doaa> {
  @override
  void initState() {
    BlocProvider.of<DoaaCubit>(context).fetchDoaaData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppbarItem(text: 'Doaa', pagename: '/',),
            SizedBox(height: 40),
            DoaaItem(),
            SizedBox(height: 30),
            DoaaNavigitionbar()
          ],
        ),
      ),
    );
  }
}
