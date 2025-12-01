import 'package:entao_range/entao_range.dart';
import 'package:test/test.dart';

void main() {
  test("close_length", () {
    expect(1.to(10, step: 1).length, 10);
    expect(10.downTo(1, step: -1).length, 10);

    expect(1.to(10, step: 2).length, 5);
    expect(1.to(10, step: 3).length, 4);
    expect(1.to(10, step: 4).length, 3);
    expect(1.to(10, step: 5).length, 2);
    expect(1.to(10, step: 6).length, 2);
    expect(1.to(10, step: 7).length, 2);
    expect(1.to(10, step: 8).length, 2);
    expect(1.to(10, step: 9).length, 2);
    expect(1.to(10, step: 10).length, 1);
    expect(10.downTo(1, step: -2).length, 5);
    expect(10.downTo(1, step: -3).length, 4);
    expect(10.downTo(1, step: -4).length, 3);
    expect(10.downTo(1, step: -5).length, 2);
    expect(10.downTo(1, step: -6).length, 2);
    expect(10.downTo(1, step: -7).length, 2);
    expect(10.downTo(1, step: -8).length, 2);
    expect(10.downTo(1, step: -9).length, 2);
    expect(10.downTo(1, step: -10).length, 1);
  });

  test("open_length", () {
    expect(1.until(10, step: 1).length, 9);
    expect(10.downUntil(1, step: -1).length, 9);

    expect(1.until(10, step: 2).length, 5);
    expect(1.until(10, step: 3).length, 3);
    expect(1.until(10, step: 4).length, 3);
    expect(1.until(10, step: 5).length, 2);
    expect(1.until(10, step: 6).length, 2);
    expect(1.until(10, step: 7).length, 2);
    expect(1.until(10, step: 8).length, 2);
    expect(1.until(10, step: 9).length, 1);
    expect(1.until(10, step: 10).length, 1);
    expect(10.downUntil(1, step: -2).length, 5);
    expect(10.downUntil(1, step: -3).length, 3);
    expect(10.downUntil(1, step: -4).length, 3);
    expect(10.downUntil(1, step: -5).length, 2);
    expect(10.downUntil(1, step: -6).length, 2);
    expect(10.downUntil(1, step: -7).length, 2);
    expect(10.downUntil(1, step: -8).length, 2);
    expect(10.downUntil(1, step: -9).length, 1);
    expect(10.downUntil(1, step: -10).length, 1);
  });
}
