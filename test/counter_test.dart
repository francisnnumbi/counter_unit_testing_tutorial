import 'package:counter_unit_testing_tutorial/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Arranging
  late Counter counter;
  setUp(() {
    counter = Counter();
  });

  group('Counter class - : ', () {
    // given when then
    test('''when instantiated then the value of count should be 0''', () {
      //Assert
      expect(counter.count, 0);
    });

    test('''when incremented then the value of count should be 1''', () {
      //Act
      counter.incrementCounter();
      final val = counter.count;
      //Assert
      expect(val, 1);
    });

    test('''when decremented then the value of count should be -1''', () {
      //Act
      counter.decrementCounter();
      final val = counter.count;
      //Assert
      expect(val, -1);
    });

    test('''when reset then the value of count should be 0''', () {
      //Act
      counter.resetCounter();
      final val = counter.count;
      //Assert
      expect(val, 0);
    });
  });
}
