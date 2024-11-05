import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manger/onbordingcontrolstate.dart';
import '../../../manger/onbordingcubit.dart';

class OnbordingButton extends StatelessWidget {
  const OnbordingButton({
    required this.controler,
    super.key,
  });
  final Onbordingcubit controler;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Onbordingcubit>.value(
      value: controler,
      child: BlocBuilder<Onbordingcubit, OnbordingState>(
          builder: (context, state) {
        Onbordingcubit controler = context.read<Onbordingcubit>();

        return SizedBox(
            height: 120,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controler.skip(context);
                      },
                      child: Text("skip")),
                  ElevatedButton(
                    onPressed: () {
                      controler.next(context);
                    },
                    child: Text("Continue"),
                  )
                ],
              ),
            ));
      }),
    );
  }
}
