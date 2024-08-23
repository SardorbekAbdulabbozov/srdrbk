import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:srdrbk/core/storage/storage.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final rootKey = GlobalKey<NavigatorState>();

final injector = GetIt.instance;

final storageService = injector<Storage>();

final scaffoldKeyDesktop = GlobalKey<ScaffoldState>();

final scaffoldKeyMobile = GlobalKey<ScaffoldState>();

final mobileGeneralSectionKey = GlobalKey();
final mobileAboutMeSectionKey = GlobalKey();
final mobileProjectsSectionKey = GlobalKey();
final mobileGetInTouchSectionKey = GlobalKey();

final desktopGeneralSectionKey = GlobalKey();
final desktopAboutMeSectionKey = GlobalKey();
final desktopProjectsSectionKey = GlobalKey();
final desktopGetInTouchSectionKey = GlobalKey();
