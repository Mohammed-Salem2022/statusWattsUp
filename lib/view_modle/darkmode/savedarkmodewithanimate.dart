   import 'package:get_storage/get_storage.dart';

class Savedarkmodewithanimate{

   final GetStorage storagedarkanimation= GetStorage();
     String keythemeanimation='keythemedarkanimation';

    saveThemeDarkDatanimation(bool isDark){
    //here even save true or false
    //هنا نحخفظ هل صح او خطاء
    storagedarkanimation.write(keythemeanimation, isDark);

   }
  bool  getThemeDarkFromstorgetheme(){
    // here even get data new false or true
    //هنا نستدعي القيمه هل هي صح او خطاء
    return storagedarkanimation.read<bool>(keythemeanimation)??false;
  }





}