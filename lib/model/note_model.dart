class NoteModel {
  final String title;
  final String subject;
  final String time;

  NoteModel({
    required this.title,
    required this.subject,
    required this.time,
  });
  factory NoteModel.fromUsser(Map data) {
    return NoteModel(
      subject: data['subject'],
      title: data['title'],
      time: data['time'],
    );
  }
}
