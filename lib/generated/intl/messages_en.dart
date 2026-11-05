// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(path) => "Saved: ${path}";

  static String m1(current, total) => "${current} / ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "apiBadRequestFormat": MessageLookupByLibrary.simpleMessage(
      "Invalid request format",
    ),
    "apiConnectionError": MessageLookupByLibrary.simpleMessage(
      "Internet connection error",
    ),
    "apiDataNotFound": MessageLookupByLibrary.simpleMessage("Data not found"),
    "apiInvalidJson": MessageLookupByLibrary.simpleMessage(
      "Server response is not valid JSON",
    ),
    "apiInvalidMeta": MessageLookupByLibrary.simpleMessage(
      "Failed to parse meta from response",
    ),
    "apiMissingData": MessageLookupByLibrary.simpleMessage(
      "Failed to read data from response",
    ),
    "apiMissingMeta": MessageLookupByLibrary.simpleMessage(
      "Failed to read meta from response",
    ),
    "apiNoInternet": MessageLookupByLibrary.simpleMessage(
      "No internet. Please try again later.",
    ),
    "apiParseError": MessageLookupByLibrary.simpleMessage(
      "An error occurred. Please try again later.",
    ),
    "apiRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to send request. Please try again",
    ),
    "apiUnknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error. Please try again later",
    ),
    "authInvalidConfirmationCode": MessageLookupByLibrary.simpleMessage(
      "Invalid confirmation code",
    ),
    "authPhoneRequired": MessageLookupByLibrary.simpleMessage(
      "Enter phone number",
    ),
    "authRefreshSessionFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to refresh session",
    ),
    "authResendCodeFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to resend code",
    ),
    "authSendCodeFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to send code",
    ),
    "authSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Session expired. Please sign in again",
    ),
    "authVerifyCodeFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to verify code",
    ),
    "characterDetailLocation": MessageLookupByLibrary.simpleMessage(
      "Current location",
    ),
    "characterDetailOrigin": MessageLookupByLibrary.simpleMessage("Origin"),
    "characterDetailSpecies": MessageLookupByLibrary.simpleMessage("Species"),
    "characterDetailStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "characterDetailTitle": MessageLookupByLibrary.simpleMessage("Character"),
    "characterStatusAlive": MessageLookupByLibrary.simpleMessage("Alive"),
    "characterStatusDead": MessageLookupByLibrary.simpleMessage("Dead"),
    "characterStatusUnknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "charactersEmpty": MessageLookupByLibrary.simpleMessage(
      "No characters found",
    ),
    "charactersSearchClear": MessageLookupByLibrary.simpleMessage(
      "Clear search",
    ),
    "charactersSearchEmpty": MessageLookupByLibrary.simpleMessage(
      "No results found",
    ),
    "charactersSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search by name",
    ),
    "charactersTitle": MessageLookupByLibrary.simpleMessage("Characters"),
    "chatSendMessageFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to send message",
    ),
    "dateTimeSelect": MessageLookupByLibrary.simpleMessage("Select"),
    "dateTimeSelectTime": MessageLookupByLibrary.simpleMessage("Select time"),
    "dateTimeSelectYear": MessageLookupByLibrary.simpleMessage("Select year"),
    "enterCode": MessageLookupByLibrary.simpleMessage("Enter the code"),
    "errorLoadingText": MessageLookupByLibrary.simpleMessage(
      "Data could not be loaded. Please try again.",
    ),
    "errorLoadingTitle": MessageLookupByLibrary.simpleMessage(
      "Failed to load data",
    ),
    "fileAudioPause": MessageLookupByLibrary.simpleMessage("Pause"),
    "fileAudioPlay": MessageLookupByLibrary.simpleMessage("Play"),
    "fileListEmpty": MessageLookupByLibrary.simpleMessage("No files selected"),
    "filePickButton": MessageLookupByLibrary.simpleMessage("Choose files"),
    "filePickError": MessageLookupByLibrary.simpleMessage(
      "Failed to choose files",
    ),
    "fileViewerLocalUnavailable": MessageLookupByLibrary.simpleMessage(
      "Local file unavailable",
    ),
    "fileViewerPreviewUnavailable": MessageLookupByLibrary.simpleMessage(
      "Preview unavailable",
    ),
    "fileViewerSaveFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to save file",
    ),
    "fileViewerSaved": m0,
    "inDevelopment": MessageLookupByLibrary.simpleMessage("In development"),
    "mediaFeedAddTitle": MessageLookupByLibrary.simpleMessage("Add media"),
    "mediaFeedCamera": MessageLookupByLibrary.simpleMessage("Camera"),
    "mediaFeedGallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "mediaFeedGalleryClose": MessageLookupByLibrary.simpleMessage("Close"),
    "mediaFeedGalleryCounter": m1,
    "mediaFeedPhoto": MessageLookupByLibrary.simpleMessage("Photo"),
    "mediaFeedVideo": MessageLookupByLibrary.simpleMessage("Video"),
    "navHome": MessageLookupByLibrary.simpleMessage("Home"),
    "navProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "navShop": MessageLookupByLibrary.simpleMessage("Shop"),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "You are offline. Check your internet connection.",
    ),
    "phoneInvalid": MessageLookupByLibrary.simpleMessage(
      "Enter a valid phone number",
    ),
    "shareButton": MessageLookupByLibrary.simpleMessage("Share"),
    "shareLinkButton": MessageLookupByLibrary.simpleMessage("Share link"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "universalModalNo": MessageLookupByLibrary.simpleMessage("No"),
    "universalModalOk": MessageLookupByLibrary.simpleMessage("OK"),
    "universalModalYes": MessageLookupByLibrary.simpleMessage("Yes"),
    "validationDateOfBirth": MessageLookupByLibrary.simpleMessage(
      "Select date of birth",
    ),
    "validationEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid e-mail",
    ),
    "validationEmailRequired": MessageLookupByLibrary.simpleMessage(
      "Enter e-mail",
    ),
    "validationFio": MessageLookupByLibrary.simpleMessage("Enter full name"),
    "validationName": MessageLookupByLibrary.simpleMessage("Enter first name"),
    "validationPasswordMin": MessageLookupByLibrary.simpleMessage(
      "at least 6 characters",
    ),
    "validationPasswordMismatch": MessageLookupByLibrary.simpleMessage(
      "passwords must match",
    ),
    "validationRequiredField": MessageLookupByLibrary.simpleMessage(
      "Field is filled incorrectly",
    ),
    "validationSurname": MessageLookupByLibrary.simpleMessage(
      "Enter last name",
    ),
  };
}
