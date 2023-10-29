// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

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

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Dogs Dashboard`
  String get dogsDashboard {
    return Intl.message(
      'Dogs Dashboard',
      name: 'dogsDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Random image by breed`
  String get randomImageByBreed {
    return Intl.message(
      'Random image by breed',
      name: 'randomImageByBreed',
      desc: '',
      args: [],
    );
  }

  /// `Images list by breed`
  String get imagesListByBreed {
    return Intl.message(
      'Images list by breed',
      name: 'imagesListByBreed',
      desc: '',
      args: [],
    );
  }

  /// `Random image by breed and sub breed`
  String get randomImageByBreedAndSubBreed {
    return Intl.message(
      'Random image by breed and sub breed',
      name: 'randomImageByBreedAndSubBreed',
      desc: '',
      args: [],
    );
  }

  /// `Images list by breed and sub breed`
  String get imagesListByBreedAndSubBreed {
    return Intl.message(
      'Images list by breed and sub breed',
      name: 'imagesListByBreedAndSubBreed',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message(
      'Italian',
      name: 'italian',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Select a breed`
  String get selectBreed {
    return Intl.message(
      'Select a breed',
      name: 'selectBreed',
      desc: '',
      args: [],
    );
  }

  /// `Select a sub breed`
  String get selectSubBreed {
    return Intl.message(
      'Select a sub breed',
      name: 'selectSubBreed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Option`
  String get invalidOption {
    return Intl.message(
      'Invalid Option',
      name: 'invalidOption',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `There is no sub breeds`
  String get thereIsNoSubBreeds {
    return Intl.message(
      'There is no sub breeds',
      name: 'thereIsNoSubBreeds',
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
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'it'),
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
