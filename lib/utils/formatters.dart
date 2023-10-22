import 'package:flutter/services.dart';

class Formatters {
  static onlyLettersWithoutSpecialLetters() =>
      FilteringTextInputFormatter.allow(RegExp("[A-Za-z s]"));

  static lettersAndNumberAndSpecialCharacters() =>
      FilteringTextInputFormatter.allow(
          RegExp("[ A-Z-a-z0-9áéíóúñÁÉÍÓÚñÑ_!}+@)=}.*,%{:¿;?&(#¡]"));
}
