import 'dart:js' as js;

class WebUtil {
  static void openWebURL(String url) => {
        js.context.callMethod(
          'open',
          [
            url,
          ],
        )
      };
}
