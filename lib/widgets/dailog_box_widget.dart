import 'package:colorful_notes_app/theme/colors.dart';
import 'package:flutter/material.dart';

showDailogBoxWidget(BuildContext context,
    {String? title, VoidCallback? onTapYes, double? height}) {
      return showDialog(
        context: context, 
        builder: (context) {
          return Dialog(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),),
              backgroundColor: darkGreyColor,
            child: Container(
              width: double.infinity,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Icon(
                    Icons.info,
                    color: lightGreyColor,
                    size: 40,
                    ),
                  const SizedBox(height: 20),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.white70,
                    ),
                    ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:  () => Navigator.pop(context),
                        child: Container(
                          width: 150, 
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              ),
                          ),
                        ),
                      ),
                    GestureDetector(
                        onTap:  onTapYes,
                        child: Container(
                          width: 150, 
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              ),
                          ),
                        ),
                      ),  
                    ],
                  )    
                ],
              ),
            ),
          );
        }
        );
    }
