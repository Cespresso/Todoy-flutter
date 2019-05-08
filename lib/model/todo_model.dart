import 'package:scoped_model/scoped_model.dart';

class TodoModel extends Model{
  int _counter = 0;

  int get counter => _counter;


  void increment() {
    _counter++;
    //状態を変更したらnotifyListenersを呼ぶ。
    notifyListeners();
  }
}