// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:islami/Features/profile/prsentation/manger/cubit/profile_cubit.dart';
// import 'package:islami/Features/profile/prsentation/manger/cubit/profile_state.dart';

// class UserImage extends StatelessWidget {
//   const UserImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         if (state is ProfileImageUploaded) {
//          String imageUrl =state.photoUrl;
//           return Center(
//           child: ClipOval(
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   image: 
//                        DecorationImage(
//                           image: NetworkImage(imageUrl),
//                           fit: BoxFit.cover,
//                         )
//                       ,
//                 ),
//                 child: imageUrl == null
//                     ? const Icon(
//                         CupertinoIcons.person_alt,
//                         size: 100,
//                         color: Color.fromARGB(255, 58, 93, 162),
//                       )
//                     : null,
//                 ),
                
//                   Positioned(
//                     top: 16,
//                     child: IconButton(
//                       icon: const Icon(
//                         CupertinoIcons.person_alt,
//                         size: 200,
//                         color: Color.fromARGB(255, 58, 93, 162),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 Positioned(
//                   right: 35,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.edit_rounded,
//                       size: 40,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
        
          
//         }
//         else if ( state is ProfileImageUploading)
//          CircularProgressIndicator();
//       },
//     );
//   }
// }
