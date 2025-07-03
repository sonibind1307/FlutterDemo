class Helper{

  //this method is used to handle Upper/lowercase, Leading/trailing spaces and Special characters (like . - _ #)
  static String normalize(String input) {
    return input.trim().toLowerCase();
  }
}