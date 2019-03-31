class EmailSummary {
  String id;
  String title;
  DateTime date;
  String object;
  String message;

  EmailSummary(String id, String title, DateTime date, String object, String message) {
    this.id = id;
    this.title = title;
    this.date = date;
    this.object = object;
    this.message = message;
  }
}