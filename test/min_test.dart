import 'package:entao_range/entao_range.dart';
import 'package:test/test.dart';

void main() {
  test("close_min", () {
    CloseRange r = 1.to(10, step: 1);
    expect(r.minValue, 1);

    CloseRange r2 = 1.to(10, step: 2);
    expect(r2.minValue, 1);

    CloseRange r3 = 1.downTo(-10, step: -1);
    expect(r3.minValue, -10);

    CloseRange r4 = 2.downTo(-10, step: -2);
    expect(r4.minValue, -10);

    CloseRange r5 = 3.downTo(-10, step: -3);
    expect(r5.minValue, -9);

    CloseRange r6 = 30.downTo(10, step: -3);
    expect(r6.minValue, 12);
  });

  test("close_max", () {
    CloseRange r = 1.to(10, step: 1);
    expect(r.maxValue, 10);

    CloseRange r2 = 0.to(10, step: 2);
    expect(r2.maxValue, 10);

    CloseRange r22 = 1.to(10, step: 2);
    expect(r22.maxValue, 9);

    CloseRange r222 = 0.to(10, step: 3);
    expect(r222.maxValue, 9);

    CloseRange r3 = 0.downTo(-10, step: -1);
    expect(r3.maxValue, 0);

    CloseRange r4 = 2.downTo(-10, step: -2);
    expect(r4.maxValue, 2);

    CloseRange r5 = 3.downTo(-10, step: -3);
    expect(r5.maxValue, 3);

    CloseRange r6 = 30.downTo(10, step: -3);
    expect(r6.maxValue, 30);
  });

  test("open_min", () {
    OpenRange r = 1.until(10, step: 1);
    expect(r.minValue, 1);

    OpenRange r2 = 1.until(10, step: 2);
    expect(r2.minValue, 1);

    OpenRange r3 = 1.downUntil(-10, step: -1);
    expect(r3.minValue, -10);

    OpenRange r4 = 2.downUntil(-10, step: -2);
    expect(r4.minValue, -8);

    OpenRange r5 = 3.downUntil(-10, step: -3);
    expect(r5.minValue, -9);

    OpenRange r6 = 30.downUntil(10, step: -3);
    expect(r6.minValue, 12);
  });

  test("open_max", () {
    OpenRange r = 1.until(10, step: 1);
    expect(r.maxValue, 9);

    OpenRange r2 = 0.until(10, step: 2);
    expect(r2.maxValue, 8);

    OpenRange r22 = 1.until(10, step: 2);
    expect(r22.maxValue, 9);

    OpenRange r222 = 0.until(10, step: 3);
    expect(r222.maxValue, 9);

    OpenRange r3 = 0.downUntil(-10, step: -1);
    expect(r3.maxValue, 0);

    OpenRange r4 = 2.downUntil(-10, step: -2);
    expect(r4.maxValue, 2);

    OpenRange r5 = 3.downUntil(-10, step: -3);
    expect(r5.maxValue, 3);

    OpenRange r6 = 30.downUntil(10, step: -3);
    expect(r6.maxValue, 30);
  });
}
