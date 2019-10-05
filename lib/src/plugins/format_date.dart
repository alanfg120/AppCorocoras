import 'package:intl/intl.dart';

class Format extends DateFormat {
  Format();

  String formato(String fecha) {

   
     if(fecha==null) return null;
     else return DateFormat("dd/MM/yyyy").format(DateTime.parse(fecha));

  }
}
