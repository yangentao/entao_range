import 'package:entao_range/entao_range.dart';
import 'package:test/test.dart';

void main() {
  test("close_contains", () {
    CloseRange r = 1.to(10, step: 1);
    expect(r.contains(3), true);

    CloseRange r2 = 1.to(10, step: 2);
    expect(r2.contains(3), true);

    CloseRange r3 = 1.to(10, step: 3);
    expect(r3.contains(3), false);

    CloseRange r4 = (-10).to(10, step: 3);
    expect(r4.contains(-9), false);
    expect(r4.contains(0), false);
    expect(r4.contains(2), true);
    expect(r4.contains(10), false);
    expect(r4.contains(20), false);
    expect(r4.contains(-20), false);

    CloseRange r5 = (10).downTo(-10, step: -3);
    expect(r5.contains(20), false);
    expect(r5.contains(10), true);
    expect(r5.contains(9), false);
    expect(r5.contains(8), false);
    expect(r5.contains(7), true);
    expect(r5.contains(6), false);
    expect(r5.contains(0), false);
    expect(r5.contains(-8), true);
    expect(r5.contains(-9), false);
    expect(r5.contains(-10), false);
    expect(r5.contains(-20), false);
  });

  test("open_contains", () {
    OpenRange r = 1.until(10, step: 1);
    expect(r.contains(0), false);
    expect(r.contains(1), true);
    expect(r.contains(3), true);
    expect(r.contains(10), false);
    expect(r.contains(11), false);

    OpenRange r2 = 1.until(10, step: 2);
    expect(r2.contains(0), false);
    expect(r2.contains(1), true);
    expect(r2.contains(3), true);
    expect(r2.contains(4), false);
    expect(r2.contains(9), true);
    expect(r2.contains(10), false);

    OpenRange r3 = 1.until(10, step: 3);
    expect(r3.contains(0), false);
    expect(r3.contains(1), true);
    expect(r3.contains(2), false);
    expect(r3.contains(3), false);
    expect(r3.contains(4), true);
    expect(r3.contains(9), false);
    expect(r3.contains(10), false);
    expect(r3.contains(11), false);

    OpenRange r4 = (-10).until(10, step: 3);
    expect(r4.contains(-20), false);
    expect(r4.contains(-10), true);
    expect(r4.contains(-9), false);
    expect(r4.contains(-7), true);
    expect(r4.contains(0), false);
    expect(r4.contains(2), true);
    expect(r4.contains(9), false);
    expect(r4.contains(10), false);
    expect(r4.contains(20), false);

    OpenRange r5 = (10).downUntil(-10, step: -3);
    expect(r5.contains(20), false);
    expect(r5.contains(10), true);
    expect(r5.contains(9), false);
    expect(r5.contains(8), false);
    expect(r5.contains(7), true);
    expect(r5.contains(6), false);
    expect(r5.contains(0), false);
    expect(r5.contains(-9), false);
    expect(r5.contains(-10), false);
    expect(r5.contains(-20), false);
  });
}
