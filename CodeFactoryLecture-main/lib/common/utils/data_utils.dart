import '../const/data.dart';

class DataUtils{
  static String pathToUrl(String val) => 'http://$ip$val';

  static List<String> listPathsToUrls(List<String> paths){
    return paths.map((e) => pathToUrl(e)).toList();
  }
}