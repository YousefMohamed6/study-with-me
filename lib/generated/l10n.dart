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

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Picture`
  String get picture {
    return Intl.message(
      'Picture',
      name: 'picture',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `ToDo`
  String get todo {
    return Intl.message(
      'ToDo',
      name: 'todo',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Book Name`
  String get bookName {
    return Intl.message(
      'Book Name',
      name: 'bookName',
      desc: '',
      args: [],
    );
  }

  /// `Picture Name`
  String get pictureName {
    return Intl.message(
      'Picture Name',
      name: 'pictureName',
      desc: '',
      args: [],
    );
  }

  /// `Task Name`
  String get taskName {
    return Intl.message(
      'Task Name',
      name: 'taskName',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Sava`
  String get save {
    return Intl.message(
      'Sava',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yousef Mohamed`
  String get name {
    return Intl.message(
      'Yousef Mohamed',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number  : `
  String get phone {
    return Intl.message(
      'Phone Number  : ',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineer`
  String get jop {
    return Intl.message(
      'Software Engineer',
      name: 'jop',
      desc: '',
      args: [],
    );
  }

  /// `Email Address  : `
  String get email {
    return Intl.message(
      'Email Address  : ',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Empty Name`
  String get emptyName {
    return Intl.message(
      'Empty Name',
      name: 'emptyName',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this?`
  String get deleteMessage {
    return Intl.message(
      'Do you want to delete this?',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `select Picture Success`
  String get selectimageSuccess {
    return Intl.message(
      'select Picture Success',
      name: 'selectimageSuccess',
      desc: '',
      args: [],
    );
  }

  /// `select Picture Failure`
  String get selectimageFailure {
    return Intl.message(
      'select Picture Failure',
      name: 'selectimageFailure',
      desc: '',
      args: [],
    );
  }

  /// `select Book Success`
  String get selectbookSuccess {
    return Intl.message(
      'select Book Success',
      name: 'selectbookSuccess',
      desc: '',
      args: [],
    );
  }

  /// `select Book Failure`
  String get selectiBookFailure {
    return Intl.message(
      'select Book Failure',
      name: 'selectiBookFailure',
      desc: '',
      args: [],
    );
  }

  /// `Edit Success`
  String get editSuccess {
    return Intl.message(
      'Edit Success',
      name: 'editSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Add Success`
  String get addSuccess {
    return Intl.message(
      'Add Success',
      name: 'addSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Plesae select Book`
  String get usSelectedBook {
    return Intl.message(
      'Plesae select Book',
      name: 'usSelectedBook',
      desc: '',
      args: [],
    );
  }

  /// `Plesae select picture`
  String get usSelectedImage {
    return Intl.message(
      'Plesae select picture',
      name: 'usSelectedImage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
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
