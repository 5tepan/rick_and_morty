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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Вы не в сети. Проверьте подключение к Интернету.`
  String get noInternet {
    return Intl.message(
      'Вы не в сети. Проверьте подключение к Интернету.',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `В разработке`
  String get inDevelopment {
    return Intl.message(
      'В разработке',
      name: 'inDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Попробовать снова`
  String get tryAgain {
    return Intl.message(
      'Попробовать снова',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка загрузки данных`
  String get errorLoadingTitle {
    return Intl.message(
      'Ошибка загрузки данных',
      name: 'errorLoadingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Данные не были загружены, пожалуйста, попробуйте еще раз`
  String get errorLoadingText {
    return Intl.message(
      'Данные не были загружены, пожалуйста, попробуйте еще раз',
      name: 'errorLoadingText',
      desc: '',
      args: [],
    );
  }

  /// `Введите код`
  String get enterCode {
    return Intl.message('Введите код', name: 'enterCode', desc: '', args: []);
  }

  /// `Введите корректный номер телефона`
  String get phoneInvalid {
    return Intl.message(
      'Введите корректный номер телефона',
      name: 'phoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Нет интернета. Попробуйте позже.`
  String get apiNoInternet {
    return Intl.message(
      'Нет интернета. Попробуйте позже.',
      name: 'apiNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка подключения к интернету`
  String get apiConnectionError {
    return Intl.message(
      'Ошибка подключения к интернету',
      name: 'apiConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестная ошибка. Попробуйте позже`
  String get apiUnknownError {
    return Intl.message(
      'Неизвестная ошибка. Попробуйте позже',
      name: 'apiUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось отправить запрос. Попробуйте еще раз`
  String get apiRequestFailed {
    return Intl.message(
      'Не удалось отправить запрос. Попробуйте еще раз',
      name: 'apiRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Данные не найдены`
  String get apiDataNotFound {
    return Intl.message(
      'Данные не найдены',
      name: 'apiDataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Произошла ошибка. Попробуйте позже.`
  String get apiParseError {
    return Intl.message(
      'Произошла ошибка. Попробуйте позже.',
      name: 'apiParseError',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось получить meta часть запроса`
  String get apiMissingMeta {
    return Intl.message(
      'Не удалось получить meta часть запроса',
      name: 'apiMissingMeta',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось получить data часть запроса`
  String get apiMissingData {
    return Intl.message(
      'Не удалось получить data часть запроса',
      name: 'apiMissingData',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось разобрать meta часть запроса`
  String get apiInvalidMeta {
    return Intl.message(
      'Не удалось разобрать meta часть запроса',
      name: 'apiInvalidMeta',
      desc: '',
      args: [],
    );
  }

  /// `Некорректный формат запроса`
  String get apiBadRequestFormat {
    return Intl.message(
      'Некорректный формат запроса',
      name: 'apiBadRequestFormat',
      desc: '',
      args: [],
    );
  }

  /// `Ответ сервера не является валидным JSON`
  String get apiInvalidJson {
    return Intl.message(
      'Ответ сервера не является валидным JSON',
      name: 'apiInvalidJson',
      desc: '',
      args: [],
    );
  }

  /// `Укажите номер телефона`
  String get authPhoneRequired {
    return Intl.message(
      'Укажите номер телефона',
      name: 'authPhoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Неверный код подтверждения`
  String get authInvalidConfirmationCode {
    return Intl.message(
      'Неверный код подтверждения',
      name: 'authInvalidConfirmationCode',
      desc: '',
      args: [],
    );
  }

  /// `Сессия истекла. Войдите снова`
  String get authSessionExpired {
    return Intl.message(
      'Сессия истекла. Войдите снова',
      name: 'authSessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось отправить код`
  String get authSendCodeFailed {
    return Intl.message(
      'Не удалось отправить код',
      name: 'authSendCodeFailed',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось подтвердить код`
  String get authVerifyCodeFailed {
    return Intl.message(
      'Не удалось подтвердить код',
      name: 'authVerifyCodeFailed',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось отправить код повторно`
  String get authResendCodeFailed {
    return Intl.message(
      'Не удалось отправить код повторно',
      name: 'authResendCodeFailed',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось обновить сессию`
  String get authRefreshSessionFailed {
    return Intl.message(
      'Не удалось обновить сессию',
      name: 'authRefreshSessionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату рождения`
  String get validationDateOfBirth {
    return Intl.message(
      'Выберите дату рождения',
      name: 'validationDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Введите имя`
  String get validationName {
    return Intl.message(
      'Введите имя',
      name: 'validationName',
      desc: '',
      args: [],
    );
  }

  /// `Введите фамилию`
  String get validationSurname {
    return Intl.message(
      'Введите фамилию',
      name: 'validationSurname',
      desc: '',
      args: [],
    );
  }

  /// `Введите ФИО`
  String get validationFio {
    return Intl.message(
      'Введите ФИО',
      name: 'validationFio',
      desc: '',
      args: [],
    );
  }

  /// `Неверно заполнено поле`
  String get validationRequiredField {
    return Intl.message(
      'Неверно заполнено поле',
      name: 'validationRequiredField',
      desc: '',
      args: [],
    );
  }

  /// `не менее 6 символов`
  String get validationPasswordMin {
    return Intl.message(
      'не менее 6 символов',
      name: 'validationPasswordMin',
      desc: '',
      args: [],
    );
  }

  /// `Введите e-mail`
  String get validationEmailRequired {
    return Intl.message(
      'Введите e-mail',
      name: 'validationEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Некорректный e-mail`
  String get validationEmailInvalid {
    return Intl.message(
      'Некорректный e-mail',
      name: 'validationEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `пароль должен совпадать`
  String get validationPasswordMismatch {
    return Intl.message(
      'пароль должен совпадать',
      name: 'validationPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get navHome {
    return Intl.message('Главная', name: 'navHome', desc: '', args: []);
  }

  /// `Магазин`
  String get navShop {
    return Intl.message('Магазин', name: 'navShop', desc: '', args: []);
  }

  /// `Профиль`
  String get navProfile {
    return Intl.message('Профиль', name: 'navProfile', desc: '', args: []);
  }

  /// `Не удалось отправить сообщение`
  String get chatSendMessageFailed {
    return Intl.message(
      'Не удалось отправить сообщение',
      name: 'chatSendMessageFailed',
      desc: '',
      args: [],
    );
  }

  /// `Добавить медиа`
  String get mediaFeedAddTitle {
    return Intl.message(
      'Добавить медиа',
      name: 'mediaFeedAddTitle',
      desc: '',
      args: [],
    );
  }

  /// `Камера`
  String get mediaFeedCamera {
    return Intl.message('Камера', name: 'mediaFeedCamera', desc: '', args: []);
  }

  /// `Галерея`
  String get mediaFeedGallery {
    return Intl.message(
      'Галерея',
      name: 'mediaFeedGallery',
      desc: '',
      args: [],
    );
  }

  /// `Фото`
  String get mediaFeedPhoto {
    return Intl.message('Фото', name: 'mediaFeedPhoto', desc: '', args: []);
  }

  /// `Видео`
  String get mediaFeedVideo {
    return Intl.message('Видео', name: 'mediaFeedVideo', desc: '', args: []);
  }

  /// `{current} / {total}`
  String mediaFeedGalleryCounter(int current, int total) {
    return Intl.message(
      '$current / $total',
      name: 'mediaFeedGalleryCounter',
      desc: '',
      args: [current, total],
    );
  }

  /// `Закрыть`
  String get mediaFeedGalleryClose {
    return Intl.message(
      'Закрыть',
      name: 'mediaFeedGalleryClose',
      desc: '',
      args: [],
    );
  }

  /// `Файлы не выбраны`
  String get fileListEmpty {
    return Intl.message(
      'Файлы не выбраны',
      name: 'fileListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать файлы`
  String get filePickButton {
    return Intl.message(
      'Выбрать файлы',
      name: 'filePickButton',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось выбрать файлы`
  String get filePickError {
    return Intl.message(
      'Не удалось выбрать файлы',
      name: 'filePickError',
      desc: '',
      args: [],
    );
  }

  /// `Предпросмотр недоступен`
  String get fileViewerPreviewUnavailable {
    return Intl.message(
      'Предпросмотр недоступен',
      name: 'fileViewerPreviewUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Локальный файл недоступен`
  String get fileViewerLocalUnavailable {
    return Intl.message(
      'Локальный файл недоступен',
      name: 'fileViewerLocalUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось сохранить файл`
  String get fileViewerSaveFailed {
    return Intl.message(
      'Не удалось сохранить файл',
      name: 'fileViewerSaveFailed',
      desc: '',
      args: [],
    );
  }

  /// `Сохранено: {path}`
  String fileViewerSaved(String path) {
    return Intl.message(
      'Сохранено: $path',
      name: 'fileViewerSaved',
      desc: '',
      args: [path],
    );
  }

  /// `Пауза`
  String get fileAudioPause {
    return Intl.message('Пауза', name: 'fileAudioPause', desc: '', args: []);
  }

  /// `Воспроизвести`
  String get fileAudioPlay {
    return Intl.message(
      'Воспроизвести',
      name: 'fileAudioPlay',
      desc: '',
      args: [],
    );
  }

  /// `Поделиться`
  String get shareButton {
    return Intl.message('Поделиться', name: 'shareButton', desc: '', args: []);
  }

  /// `Поделиться ссылкой`
  String get shareLinkButton {
    return Intl.message(
      'Поделиться ссылкой',
      name: 'shareLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать`
  String get dateTimeSelect {
    return Intl.message('Выбрать', name: 'dateTimeSelect', desc: '', args: []);
  }

  /// `Выберите время`
  String get dateTimeSelectTime {
    return Intl.message(
      'Выберите время',
      name: 'dateTimeSelectTime',
      desc: '',
      args: [],
    );
  }

  /// `Выберите год`
  String get dateTimeSelectYear {
    return Intl.message(
      'Выберите год',
      name: 'dateTimeSelectYear',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get universalModalYes {
    return Intl.message('Да', name: 'universalModalYes', desc: '', args: []);
  }

  /// `Нет`
  String get universalModalNo {
    return Intl.message('Нет', name: 'universalModalNo', desc: '', args: []);
  }

  /// `Ок`
  String get universalModalOk {
    return Intl.message('Ок', name: 'universalModalOk', desc: '', args: []);
  }

  /// `Персонажи`
  String get charactersTitle {
    return Intl.message(
      'Персонажи',
      name: 'charactersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Персонажи не найдены`
  String get charactersEmpty {
    return Intl.message(
      'Персонажи не найдены',
      name: 'charactersEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Жив`
  String get characterStatusAlive {
    return Intl.message(
      'Жив',
      name: 'characterStatusAlive',
      desc: '',
      args: [],
    );
  }

  /// `Мёртв`
  String get characterStatusDead {
    return Intl.message(
      'Мёртв',
      name: 'characterStatusDead',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестно`
  String get characterStatusUnknown {
    return Intl.message(
      'Неизвестно',
      name: 'characterStatusUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Поиск по имени`
  String get charactersSearchHint {
    return Intl.message(
      'Поиск по имени',
      name: 'charactersSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Ничего не найдено`
  String get charactersSearchEmpty {
    return Intl.message(
      'Ничего не найдено',
      name: 'charactersSearchEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Очистить поиск`
  String get charactersSearchClear {
    return Intl.message(
      'Очистить поиск',
      name: 'charactersSearchClear',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
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
