import 'package:flutter/material.dart';
import 'package:student_management/utils/colors.dart';
import 'package:student_management/utils/styles.dart';

// ignore: camel_case_types
class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                // height: MediaQuery.of(context).size.height * 0.1,
                child: TextFormField(
                  onChanged: (value) {
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search...",
                      hintStyle: TextStyles.search,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                },
                focusColor: Colors.amber,
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
