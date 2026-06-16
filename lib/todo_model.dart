class TodoModel {
  final String title;
  bool isdone;
  TodoModel({required this.title, this.isdone = false});

  void togll() {
    isdone = !isdone;
  }

  

  
}
