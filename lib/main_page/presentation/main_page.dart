import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srdrbk/components/widgets/loading_widget.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/main_page/bloc/main_page_bloc.dart';
import 'package:srdrbk/main_page/presentation/desktop_view/desktop_view.dart';
import 'package:srdrbk/main_page/presentation/mobile_view/mobile_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log(
      "isTablet = ${BaseFunctions.isTablet(context)}, w: ${size.width}, h: ${size.height}",
      name: "Size",
    );
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return state.isLoading
            ? const LoadingWidget()
            : ScreenTypeLayout.builder(
                breakpoints: const ScreenBreakpoints(
                  desktop: 1146,
                  tablet: 600,
                  watch: 300,
                ),
                mobile: (context) => MobileView(state: state),
                desktop: (context) => DesktopView(state: state),
                tablet: (context) => MobileView(state: state),
              );
      },
    );
  }
}
