import 'package:entao_range/entao_range.dart';
import 'package:test/test.dart';

void main() {
  test('First Test', () {
    for(int i in 10.indexes){
      print(i);
    }

    expect(0.to(10, step: 2).toList(), equals([0, 2, 4, 6, 8, 10]));
    expect(0.until(10, step: 2).toList(), equals([0, 2, 4, 6, 8]));
    expect(10.downTo(0, step: -2).toList(), equals([10, 8, 6, 4, 2, 0]));
    expect(10.downUntil(0, step: -2).toList(), equals([10, 8, 6, 4, 2]));
  });
}
