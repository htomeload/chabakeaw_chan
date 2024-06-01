import "package:chabakeaw_chan/mobile/about_mobile.dart";
import "package:chabakeaw_chan/mobile/contact_mobile.dart";
import "package:chabakeaw_chan/mobile/landing_page_mobile.dart";
import "package:chabakeaw_chan/mobile/works_mobile.dart";
import "package:chabakeaw_chan/share/blog.dart";
import "package:chabakeaw_chan/web/about_web.dart";
import "package:chabakeaw_chan/web/contact_web.dart";
import "package:chabakeaw_chan/web/landing_page_web.dart";
import "package:chabakeaw_chan/web/works_web.dart";
import "package:flutter/material.dart";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return ContactWeb();
            } else {
              return ContactMobile();
            }
          }),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return AboutWeb();
            } else {
              return AboutMobile();
            }
          }),
        );
      case '/lit_link':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Blog(),
        );
      case '/works':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return WorksWeb();
            } else {
              return WorksMobile();
            }
          }),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
    }
  }
}
