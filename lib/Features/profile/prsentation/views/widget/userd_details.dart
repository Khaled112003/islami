import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/profile/prsentation/manger/user_image/profile_cubit.dart';
import 'package:islami/Features/profile/prsentation/manger/user_image/profile_state.dart';
import 'package:islami/Features/profile/prsentation/views/widget/inforamtion_item.dart';
import 'package:islami/Features/profile/prsentation/views/widget/message.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoCubit, InfoState>(
      builder: (context, state) {
       if( state is InfoSuccess){
         return Column(
          children: [
             Text(
              state.user.username,
              style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
             UserInformation(name:  state.user.username,),
             UserInformation(name:  state.user.email,),
            const AlertMessage(),
          ],
        );
       }
       else if( state is InfoFailure){
        return FailureErrorMessage(errormassage: state.errorMessage,);
       }
       else{
        return CircularProgressIndicator();
       }
      },
    );
  }
}
