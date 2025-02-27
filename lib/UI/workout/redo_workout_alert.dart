import 'package:exerlog/UI/global.dart';
import 'package:exerlog/UI/gradient_border_button.dart';
import 'package:exerlog/src/widgets/gradient_button.dart';
import 'package:exerlog/src/widgets/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class RedoWorkoutAlert extends StatelessWidget {
  final RaisedGradientButton viewWorkout;
  final GradientBorderButton redoWorkout;
  const RedoWorkoutAlert(
    this.viewWorkout,
    this.redoWorkout,
  );
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(builder: (context, theme) {
      return Dialog(
        backgroundColor: theme.colorTheme.backgroundColorVariation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(15),
          height: screenHeight * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Do you wanna view or redo?",
                style: mediumTitleStyleWhite,
                textAlign: TextAlign.center,
              ),
              // new or template
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.3,
                    child: viewWorkout,
                  ),
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.3,
                    child: redoWorkout,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
