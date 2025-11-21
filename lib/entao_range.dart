library;

class OpenRange extends IntRange {
  OpenRange(super.start, super.end, {super.step});

  @override
  Iterator<int> get iterator => _OpenRangeIterator(this);
}

class CloseRange extends IntRange {
  CloseRange(super.start, super.end, {super.step});

  @override
  Iterator<int> get iterator => _CloseRangeIterator(this);
}

sealed class IntRange extends Iterable<int> {
  final int start;
  final int end;
  final int step;

  IntRange(this.start, this.end, {this.step = 1}) : assert(step != 0 && (step > 0 && end >= start || step < 0 && end <= start));

  bool get isClosed => this is CloseRange;

  bool get isOpen => this is OpenRange;
}

class _OpenRangeIterator implements Iterator<int> {
  final IntRange range;
  int _value;

  _OpenRangeIterator(this.range) : _value = range.start - range.step;

  @override
  int get current => _value;

  @override
  bool moveNext() {
    _value += range.step;
    if (range.step > 0) {
      return _value < range.end;
    } else {
      return _value > range.end;
    }
  }
}

class _CloseRangeIterator implements Iterator<int> {
  final IntRange range;
  int _value;

  _CloseRangeIterator(this.range) : _value = range.start - range.step;

  @override
  int get current => _value;

  @override
  bool moveNext() {
    _value += range.step;
    if (range.step > 0) {
      return _value <= range.end;
    } else {
      return _value >= range.end;
    }
  }
}

extension IntRangeExt on int {
  OpenRange get indexes => OpenRange(0, this, step: 1);

  CloseRange to(int end, {int step = 1}) => CloseRange(this, end, step: step);

  OpenRange until(int end, {int step = 1}) => OpenRange(this, end, step: step);

  CloseRange downTo(int value, {int step = -1}) => CloseRange(this, value, step: step);

  OpenRange downUntil(int value, {int step = -1}) => OpenRange(this, value, step: step);
}
