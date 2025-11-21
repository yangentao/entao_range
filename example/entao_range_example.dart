import 'package:entao_range/entao_range.dart';

void main() {
  for (int i in 0.to(10)) {
    print(i);
  }
  print(0.to(10, step: 2));
  print(0.until(10, step: 2));
  print(10.downTo(0, step: -2));
  print(10.downUntil(0, step: -2));

  CloseRange r = 1.to(10);
  print(r);
  OpenRange r2 = 1.until(10);
  print(r2);
}
