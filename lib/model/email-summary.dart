class EmailSummary {
  String title;
  DateTime date;
  String object;
  String message;

  EmailSummary(String title, DateTime date, String object, String message) {
    this.title = title;
    this.date = date;
    this.object = object;
    this.message = message;
  }
}