// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a he locale. All the
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
  String get localeName => 'he';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "date_of_birth": MessageLookupByLibrary.simpleMessage("תאריך לידה"),
        "error_loading_favorites":
            MessageLookupByLibrary.simpleMessage("שגיאה בטעינת המועדפים:"),
        "no_favorites":
            MessageLookupByLibrary.simpleMessage("אין מועדפים עדיין"),
        "old_young_to": MessageLookupByLibrary.simpleMessage("מהזקן לצעיר"),
        "search_placeholder":
            MessageLookupByLibrary.simpleMessage("חפש לפי שם, אימייל, תאריך"),
        "sort": MessageLookupByLibrary.simpleMessage("מיון"),
        "user_favorites": MessageLookupByLibrary.simpleMessage("מועדפים"),
        "users_title": MessageLookupByLibrary.simpleMessage("משתמשים"),
        "without_sort": MessageLookupByLibrary.simpleMessage("ללא מיון"),
        "young_to_old": MessageLookupByLibrary.simpleMessage("מהצעיר לזקן")
      };
}
