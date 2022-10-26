import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';


class DbOpenHelper{

  static Future<String> getDbDirPath() async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dirName = 'databases';
    String dirPath = path.join(appDocDir.path, dirName);

     if(Platform.isAndroid){
       dirPath = path.join(appDocDir.parent.path, dirName);
     }
    if(Platform.isWindows||Platform.isLinux){
      dirPath = path.join(appDocDir.path, 'FlutterUnit','databases');
    }

    Directory result = Directory(dirPath);
    if(!result.existsSync()){
      result.createSync(recursive: true);
    }
    print('====数据库所在文件夹: $dirPath=======');
    return dirPath;
  }
}