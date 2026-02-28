import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

// CounterModel adalah class yang akan kita gunakan untuk menyimpan nilai counter dan mengubahnya
class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

// agar counter bisa diakses di seluruh aplikasi, kita buat provider untuk CounterModel
final counterProvider = StateProvider<int>((ref) {
  return 0;
});