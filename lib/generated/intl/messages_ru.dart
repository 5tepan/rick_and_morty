// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(path) => "Сохранено: ${path}";

  static String m1(current, total) => "${current} / ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "apiBadRequestFormat": MessageLookupByLibrary.simpleMessage(
      "Некорректный формат запроса",
    ),
    "apiConnectionError": MessageLookupByLibrary.simpleMessage(
      "Ошибка подключения к интернету",
    ),
    "apiDataNotFound": MessageLookupByLibrary.simpleMessage(
      "Данные не найдены",
    ),
    "apiInvalidJson": MessageLookupByLibrary.simpleMessage(
      "Ответ сервера не является валидным JSON",
    ),
    "apiInvalidMeta": MessageLookupByLibrary.simpleMessage(
      "Не удалось разобрать meta часть запроса",
    ),
    "apiMissingData": MessageLookupByLibrary.simpleMessage(
      "Не удалось получить data часть запроса",
    ),
    "apiMissingMeta": MessageLookupByLibrary.simpleMessage(
      "Не удалось получить meta часть запроса",
    ),
    "apiNoInternet": MessageLookupByLibrary.simpleMessage(
      "Нет интернета. Попробуйте позже.",
    ),
    "apiParseError": MessageLookupByLibrary.simpleMessage(
      "Произошла ошибка. Попробуйте позже.",
    ),
    "apiRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось отправить запрос. Попробуйте еще раз",
    ),
    "apiUnknownError": MessageLookupByLibrary.simpleMessage(
      "Неизвестная ошибка. Попробуйте позже",
    ),
    "authInvalidConfirmationCode": MessageLookupByLibrary.simpleMessage(
      "Неверный код подтверждения",
    ),
    "authPhoneRequired": MessageLookupByLibrary.simpleMessage(
      "Укажите номер телефона",
    ),
    "authRefreshSessionFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось обновить сессию",
    ),
    "authResendCodeFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось отправить код повторно",
    ),
    "authSendCodeFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось отправить код",
    ),
    "authSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Сессия истекла. Войдите снова",
    ),
    "authVerifyCodeFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось подтвердить код",
    ),
    "characterDetailLocation": MessageLookupByLibrary.simpleMessage(
      "Текущая локация",
    ),
    "characterDetailOrigin": MessageLookupByLibrary.simpleMessage(
      "Происхождение",
    ),
    "characterDetailSpecies": MessageLookupByLibrary.simpleMessage("Вид"),
    "characterDetailStatus": MessageLookupByLibrary.simpleMessage("Статус"),
    "characterDetailTitle": MessageLookupByLibrary.simpleMessage("Персонаж"),
    "characterStatusAlive": MessageLookupByLibrary.simpleMessage("Жив"),
    "characterStatusDead": MessageLookupByLibrary.simpleMessage("Мёртв"),
    "characterStatusUnknown": MessageLookupByLibrary.simpleMessage(
      "Неизвестно",
    ),
    "charactersEmpty": MessageLookupByLibrary.simpleMessage(
      "Персонажи не найдены",
    ),
    "charactersSearchClear": MessageLookupByLibrary.simpleMessage(
      "Очистить поиск",
    ),
    "charactersSearchEmpty": MessageLookupByLibrary.simpleMessage(
      "Ничего не найдено",
    ),
    "charactersSearchHint": MessageLookupByLibrary.simpleMessage(
      "Поиск по имени",
    ),
    "charactersTitle": MessageLookupByLibrary.simpleMessage("Персонажи"),
    "chatSendMessageFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось отправить сообщение",
    ),
    "dateTimeSelect": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "dateTimeSelectTime": MessageLookupByLibrary.simpleMessage(
      "Выберите время",
    ),
    "dateTimeSelectYear": MessageLookupByLibrary.simpleMessage("Выберите год"),
    "enterCode": MessageLookupByLibrary.simpleMessage("Введите код"),
    "errorLoadingText": MessageLookupByLibrary.simpleMessage(
      "Данные не были загружены, пожалуйста, попробуйте еще раз",
    ),
    "errorLoadingTitle": MessageLookupByLibrary.simpleMessage(
      "Ошибка загрузки данных",
    ),
    "fileAudioPause": MessageLookupByLibrary.simpleMessage("Пауза"),
    "fileAudioPlay": MessageLookupByLibrary.simpleMessage("Воспроизвести"),
    "fileListEmpty": MessageLookupByLibrary.simpleMessage("Файлы не выбраны"),
    "filePickButton": MessageLookupByLibrary.simpleMessage("Выбрать файлы"),
    "filePickError": MessageLookupByLibrary.simpleMessage(
      "Не удалось выбрать файлы",
    ),
    "fileViewerLocalUnavailable": MessageLookupByLibrary.simpleMessage(
      "Локальный файл недоступен",
    ),
    "fileViewerPreviewUnavailable": MessageLookupByLibrary.simpleMessage(
      "Предпросмотр недоступен",
    ),
    "fileViewerSaveFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось сохранить файл",
    ),
    "fileViewerSaved": m0,
    "inDevelopment": MessageLookupByLibrary.simpleMessage("В разработке"),
    "mediaFeedAddTitle": MessageLookupByLibrary.simpleMessage("Добавить медиа"),
    "mediaFeedCamera": MessageLookupByLibrary.simpleMessage("Камера"),
    "mediaFeedGallery": MessageLookupByLibrary.simpleMessage("Галерея"),
    "mediaFeedGalleryClose": MessageLookupByLibrary.simpleMessage("Закрыть"),
    "mediaFeedGalleryCounter": m1,
    "mediaFeedPhoto": MessageLookupByLibrary.simpleMessage("Фото"),
    "mediaFeedVideo": MessageLookupByLibrary.simpleMessage("Видео"),
    "navHome": MessageLookupByLibrary.simpleMessage("Главная"),
    "navProfile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "navShop": MessageLookupByLibrary.simpleMessage("Магазин"),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "Вы не в сети. Проверьте подключение к Интернету.",
    ),
    "phoneInvalid": MessageLookupByLibrary.simpleMessage(
      "Введите корректный номер телефона",
    ),
    "shareButton": MessageLookupByLibrary.simpleMessage("Поделиться"),
    "shareLinkButton": MessageLookupByLibrary.simpleMessage(
      "Поделиться ссылкой",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Попробовать снова"),
    "universalModalNo": MessageLookupByLibrary.simpleMessage("Нет"),
    "universalModalOk": MessageLookupByLibrary.simpleMessage("Ок"),
    "universalModalYes": MessageLookupByLibrary.simpleMessage("Да"),
    "validationDateOfBirth": MessageLookupByLibrary.simpleMessage(
      "Выберите дату рождения",
    ),
    "validationEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Некорректный e-mail",
    ),
    "validationEmailRequired": MessageLookupByLibrary.simpleMessage(
      "Введите e-mail",
    ),
    "validationFio": MessageLookupByLibrary.simpleMessage("Введите ФИО"),
    "validationName": MessageLookupByLibrary.simpleMessage("Введите имя"),
    "validationPasswordMin": MessageLookupByLibrary.simpleMessage(
      "не менее 6 символов",
    ),
    "validationPasswordMismatch": MessageLookupByLibrary.simpleMessage(
      "пароль должен совпадать",
    ),
    "validationRequiredField": MessageLookupByLibrary.simpleMessage(
      "Неверно заполнено поле",
    ),
    "validationSurname": MessageLookupByLibrary.simpleMessage(
      "Введите фамилию",
    ),
  };
}
