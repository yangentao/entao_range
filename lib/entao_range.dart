library;

class OpenRange extends IntRange {
  OpenRange(super.start, super.end, {super.step});

  int? get minValue {
    if (start == end) return null;
    if (step > 0) return start;
    if (step == -1) return end;
    int m = -(end - start) % step;
    if (m != 0) return m + end;
    return end - step;
  }

  int? get maxValue {
    if (start == end) return null;
    if (step < 0) return start;
    if (step == 1) return end - 1;
    int m = (end - start) % step;
    if (m != 0) return end - m;
    return end - step;
  }

  @override
  bool contains(Object? element) {
    if (element == null || element is! int) return false;
    int? minVal = minValue;
    if (minVal == null) return false;
    int? maxVal = maxValue;
    if (maxVal == null) return false;
    if (element > maxVal) return false;
    if (element < minVal) return false;
    return (element - minVal) % step == 0;
  }

  @override
  Iterator<int> get iterator => _OpenRangeIterator(this);
}

class CloseRange extends IntRange {
  CloseRange(super.start, super.end, {super.step});

  int get minValue {
    if (step > 0) return start;
    if (step == -1) return end;
    return -(end - start) % step + end;
  }

  int get maxValue {
    if (step < 0) return start;
    if (step == 1) return end;
    return end - (end - start) % step;
  }

  @override
  bool contains(Object? element) {
    if (element == null || element is! int) return false;
    int minVal = minValue;
    int maxVal = maxValue;
    if (element > maxVal) return false;
    if (element < minVal) return false;
    return (element - minVal) % step == 0;
  }

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

  String get desc => isClosed ? "CloseRange($start, $end, step:$step)" : "OpenRange($start, $end, step:$step)";
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

extension ListIndexRangeExt on List {
  OpenRange get indexes => length.indexes;
}
