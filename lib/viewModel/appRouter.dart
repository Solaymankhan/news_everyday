import 'package:bangladesh_news/view/favouritesPage.dart';
import 'package:bangladesh_news/view/homePage.dart';
import 'package:bangladesh_news/view/privacyPage.dart';
import 'package:bangladesh_news/view/searchPage.dart';
import 'package:bangladesh_news/view/termsPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class appRouter {
  GoRouter router =
  GoRouter(routes: [
     GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: homePage());
        }),
    GoRoute(
        path: '/search',
        pageBuilder: (context, state) {
          return MaterialPage(child: searchPage());
        }),
    GoRoute(
        path: '/favourites',
        pageBuilder: (context, state) {
          return MaterialPage(child: favouritesPage());
        }),
    GoRoute(
        path: '/privacy',
        pageBuilder: (context, state) {
          return MaterialPage(child: privacyPage());
        }),
    GoRoute(
        path: '/terms',
        pageBuilder: (context, state) {
          return MaterialPage(child: termsPage());
        }),
  ],

  );
}
