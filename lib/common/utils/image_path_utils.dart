

class ImagePathUtils {
  static const String baseUrl = "assets";
  static const String imagePrefix = "$baseUrl/";

  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }

  static String wrapDogeAssets(String url) {
    return "assets/doge/" + url;
  }




}

