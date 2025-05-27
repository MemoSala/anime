import 'package:translator/translator.dart' show GoogleTranslator;

Future<String?> translator(String? sourceText) async {
  if (sourceText != null) {
    switch (sourceText) {
      case "Action":
        return "أكشين";
      default:
        GoogleTranslator translator = GoogleTranslator();
        return (await translator.translate(
          sourceText,
          from: 'en',
          to: 'ar',
        )).text;
    }
  }
  return null; //
}

String? translatorS(String? sourceText) {
  switch (sourceText) {
    case "fall":
      return "خريف";
    case "spring":
      return "ربيع";
    case "summer":
      return "صيف";
    case "winter":
      return "شتاء";
    default:
      return sourceText;
  }
}
