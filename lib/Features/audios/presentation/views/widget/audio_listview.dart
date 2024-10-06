import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/audios/presentation/manger/audio_cubit.dart';
import 'package:islami/Features/audios/presentation/views/widget/audio_items.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading_item.dart';

class AudioListview extends StatelessWidget {
  const AudioListview({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        if (state is AudioSuccsess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.audio.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AudioItem(
                    audioUrl: state.audio[index].url!,
                    text: state.audio[index].name!,
                  ),
                );
              },
            ),
          );
        } else if (state is AudioFailure) {
          return FailureErrorMessage(errormassage: state.errorMassage);
        } else {
          return Expanded(
            child: ListView.builder(itemCount: 10,
              itemBuilder:(context, index) =>  Padding(
                padding: const EdgeInsets.all(10),
                child: LoadingItem(widget:  Container(width: MediaQuery.of(context).size.width*85,
                height: 20,
                
               
                  child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // النص في الوسط
          Container(
            width: 200,
            height: 20,
            color: Colors.grey,
          ),
          
          // الأيقونات في الوسط
          
        ],
      ),
                ),),
              ),
            ),
          );
        }
      },
    );
  }
}
