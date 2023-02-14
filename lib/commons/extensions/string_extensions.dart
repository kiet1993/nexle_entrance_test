extension StringExt on String {

  bool get isValidPassword =>
      RegExp(r"^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])").hasMatch(this);
}