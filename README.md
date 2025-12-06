## Features
Open and closed int range.

## Getting started
```dart  
CloseRange r = CloseRange(1, 10);
CloseRange r = CloseRange(1, 10, step: 2);
CloseRange r = CloseRange(10, 1, step: -2);

OpenRange r = OpenRange(1, 10);
OpenRange r = OpenRange(1, 10, step: 2);
OpenRange r = OpenRange(10, 1, step: -2);

for(int i in 10.indexes){
  print(i);
}

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
```

## minValue and maxValue
```dart
CloseRange r2 = 1.to(10, step: 2);
expect(r2.minValue, 1);

CloseRange r6 = 30.downTo(10, step: -3);
expect(r6.minValue, 12);

CloseRange r2 = 0.to(10, step: 2);
expect(r2.maxValue, 10);

CloseRange r22 = 1.to(10, step: 2);
expect(r22.maxValue, 9);

OpenRange r2 = 1.until(10, step: 2);
expect(r2.minValue, 1);

OpenRange r3 = 1.downUntil(-10, step: -1);
expect(r3.minValue, -10);

OpenRange r4 = 2.downUntil(-10, step: -2);
expect(r4.minValue, -8);

OpenRange r222 = 0.until(10, step: 3);
expect(r222.maxValue, 9);


```