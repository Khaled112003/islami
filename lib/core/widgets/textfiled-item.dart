import 'package:flutter/material.dart';

import 'package:islami/core/constant/my_color.dart';

class SerchTextFiled extends StatelessWidget {
  const SerchTextFiled({super.key, required this.searchController,required this.onchange});
  final TextEditingController searchController;
 final ValueChanged<String> onchange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height*0.05,
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 218, 216, 216),
          filled: true,
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Mycolors.green, fontSize: 18),
          prefixIcon: const Icon(
            Icons.search,
            color: Mycolors.green,
            size: 28,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Mycolors.myWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Mycolors.myWhite, width: 2),
          ),
        ),
        onChanged:onchange
      ),
    );
  }
}
