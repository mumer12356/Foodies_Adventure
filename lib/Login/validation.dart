class Valid{
  static Pattern email=
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static Pattern password=
  RegExp(r"^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$%]).{8,}$");

  static Pattern name=
  RegExp(r"^[a-zA-Z]{4,}(?: [a-zA-Z]+)?(?: [a-zA-Z]+)?$");

  static Pattern phone=
  RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$");

}

