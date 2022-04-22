class DataBase {
  late String title;
  late String content;
  late String time;
  String? password;
  String? remainder;
  bool split = false;

  DataBase({required this.title, required this.content, required this.time, this.password, this.remainder, this.split = false});

  DataBase.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    content = json["content"];
    time = json["time"];
    password = json['password'];
    remainder = json['remainder'];
    split = json['split'];
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'time': time,
    'password': password,
    'remainder': remainder,
    'split': split,
  };

  String toString() {
    return 'time: $time\ntitle: $title\ncontent: $content';
  }
}