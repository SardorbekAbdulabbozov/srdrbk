import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/components/widgets/signature_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: BaseFunctions.isDarkMode(context)
          ? AppColors.grayDarkDefault
          : AppColors.grayLightDefault,
      width: size.height,
      height: size.width,
      child: Center(
        child: SizedBox(
          width: 256,
          height: 256,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const SignatureWidget(),
              SizedBox(
                width: 36,
                height: 36,
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: BaseFunctions.isDarkMode(context)
                      ? AppColors.grayLightDefault
                      : AppColors.grayDarkDefault,
                  size: 36,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
