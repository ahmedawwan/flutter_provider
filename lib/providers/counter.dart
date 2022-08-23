import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _sum = 0;

  int get counter1 => _counter1;
  int get counter2 => _counter2;
  int get counter3 => _counter3;
  int get sum => _sum;

  incrementCounter1() {
    _counter1++;
    calculateSum();
  }

  decrementCounter1() {
    _counter1--;
    calculateSum();
  }

  incrementCounter2() {
    _counter2++;
    calculateSum();
  }

  decrementCounter2() {
    _counter2--;
    calculateSum();
  }

  incrementCounter3() {
    _counter3++;
    calculateSum();
  }

  decrementCounter3() {
    _counter3--;
    calculateSum();
  }

  calculateSum() {
    _sum = _counter1 + _counter2 + _counter3;
    notifyListeners();
  }
}
