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

  static String m0(error) => "Error on handleing post: ${error}";

  static String m1(error) => "Error on resume app: ${error}";

  static String m2(language) =>
      "Are you sure you want to set language to ${language}?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToList": MessageLookupByLibrary.simpleMessage("Add to list"),
        "author": MessageLookupByLibrary.simpleMessage("Author"),
        "away": MessageLookupByLibrary.simpleMessage(
            "You have been away fior a while."),
        "backToHome": MessageLookupByLibrary.simpleMessage("Back to home page"),
        "closeApp": MessageLookupByLibrary.simpleMessage("Close app"),
        "comment": MessageLookupByLibrary.simpleMessage("Number of comments"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "edid": MessageLookupByLibrary.simpleMessage("Edit"),
        "editing": MessageLookupByLibrary.simpleMessage("Editing"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorBringPostItems": MessageLookupByLibrary.simpleMessage(
            "An error has occured when attempting to load your post items."),
        "errorOnItemHandling": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with this item"),
        "handlePostError": m0,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "options": MessageLookupByLibrary.simpleMessage("Options"),
        "portuguese": MessageLookupByLibrary.simpleMessage("Portuguese"),
        "resumeAppError": m1,
        "selectYourLanguage":
            MessageLookupByLibrary.simpleMessage("Select your language"),
        "setLanguageConfimation": m2,
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "takePicture": MessageLookupByLibrary.simpleMessage("Take a picture"),
        "timesUp": MessageLookupByLibrary.simpleMessage("Ops!"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "ups": MessageLookupByLibrary.simpleMessage("number of ups"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yourFeed": MessageLookupByLibrary.simpleMessage("Your feed")
      };
}
