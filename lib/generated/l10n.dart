// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_final_in_for_each

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new,, lines_longer_than_80_chars
// ignore_for_file:annotate_overrides, unnecessary_string_escapes
// ignore_for_file:depend_on_referenced_packages, always_use_package_imports,
// ignore_for_file:always_specify_types, avoid_redundant_argument_values,
// ignore_for_file:prefer_final_locals, require_trailing_commas
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references,  unused_import

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Continue`
  String get sContinue {
    return Intl.message(
      'Continue',
      name: 'sContinue',
      desc: '',
      args: [],
    );
  }

  /// `UnderConstruction`
  String get underConstruction {
    return Intl.message(
      'UnderConstruction',
      name: 'underConstruction',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with your email and password \nor continue with social media`
  String get signInWithYourEmailAndPasswordNorContinueWith {
    return Intl.message(
      'Sign in with your email and password \\nor continue with social media',
      name: 'signInWithYourEmailAndPasswordNorContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      "Don't have an account?",
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `No internet connections`
  String get noInternetConnections {
    return Intl.message(
      'No internet connections',
      name: 'noInternetConnections',
      desc: '',
      args: [],
    );
  }

  /// `Cashback 20%`
  String get cashback20 {
    return Intl.message(
      'Cashback 20%',
      name: 'cashback20',
      desc: '',
      args: [],
    );
  }

  /// `A Summer Surprise\n`
  String get aSummerSurprisen {
    return Intl.message(
      'A Summer Surprise\\n',
      name: 'aSummerSurprisen',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get seeMore {
    return Intl.message(
      'See more',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Search restaurants...`
  String get searchRestaurants {
    return Intl.message(
      'Search restaurants...',
      name: 'searchRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `See more detail`
  String get seeMoreDetail {
    return Intl.message(
      'See more detail',
      name: 'seeMoreDetail',
      desc: '',
      args: [],
    );
  }

  /// `See less`
  String get seeLess {
    return Intl.message(
      'See less',
      name: 'seeLess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to the network`
  String get failedToConnectToTheNetwork {
    return Intl.message(
      'Failed to connect to the network',
      name: 'failedToConnectToTheNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Our all restaurants`
  String get ourAllRestaurants {
    return Intl.message(
      'Our all restaurants',
      name: 'ourAllRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `No restaurants found`
  String get noRestaurantsFound {
    return Intl.message(
      'No restaurants found',
      name: 'noRestaurantsFound',
      desc: '',
      args: [],
    );
  }

  /// `Our recommendations`
  String get ourRecommendations {
    return Intl.message(
      'Our recommendations',
      name: 'ourRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Our foods`
  String get ourFoods {
    return Intl.message(
      'Our foods',
      name: 'ourFoods',
      desc: '',
      args: [],
    );
  }

  /// `Our drinks`
  String get ourDrinks {
    return Intl.message(
      'Our drinks',
      name: 'ourDrinks',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Restaurants`
  String get favoriteRestaurants {
    return Intl.message(
      'Favorite Restaurants',
      name: 'favoriteRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `Added to Favorite`
  String get addedToFavorite {
    return Intl.message(
      'Added to Favorite',
      name: 'addedToFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Notification`
  String get restaurantNotification {
    return Intl.message(
      'Restaurant Notification',
      name: 'restaurantNotification',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notification`
  String get enableNotification {
    return Intl.message(
      'Enable Notification',
      name: 'enableNotification',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites`
  String get removedFromFavorites {
    return Intl.message(
      'Removed from favorites',
      name: 'removedFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Near me`
  String get nearMe {
    return Intl.message(
      'Near me',
      name: 'nearMe',
      desc: '',
      args: [],
    );
  }

  /// `Best seller`
  String get bestSeller {
    return Intl.message(
      'Best seller',
      name: 'bestSeller',
      desc: '',
      args: [],
    );
  }

  /// `Budget meal`
  String get budgetMeal {
    return Intl.message(
      'Budget meal',
      name: 'budgetMeal',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Healthy food`
  String get healthyFood {
    return Intl.message(
      'Healthy food',
      name: 'healthyFood',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Restaurant App, Let's shop!`
  String get welcomeToRestaurantAppLetsShop {
    return Intl.message(
      "Welcome to Restaurant App, Let's shop!",
      name: 'welcomeToRestaurantAppLetsShop',
      desc: '',
      args: [],
    );
  }

  /// `Do you want a hamburger?`
  String get doYouWantAHamburger {
    return Intl.message(
      'Do you want a hamburger?',
      name: 'doYouWantAHamburger',
      desc: '',
      args: [],
    );
  }

  /// `Or, do you want an ice cream?`
  String get orDoYouWantAnIceCream {
    return Intl.message(
      'Or, do you want an ice cream?',
      name: 'orDoYouWantAnIceCream',
      desc: '',
      args: [],
    );
  }

  /// `Let's shop and eating together!`
  String get letsShopAndEatingTogether {
    return Intl.message(
      "Let's shop and eating together!",
      name: 'letsShopAndEatingTogether',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
