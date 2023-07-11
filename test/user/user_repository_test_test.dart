import 'package:counter_unit_testing_tutorial/user/user_model.dart';
import 'package:counter_unit_testing_tutorial/user/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  const mockUserResponse =
  '''{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","phone": "1-770-736-8031 x56442","website": "hildegard.org"}''';

  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  void arrangeHttpGetCallWithStatusCode200() {
    when(
      () => mockHTTPClient
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),
    ).thenAnswer((invocation) async {
      return Response(mockUserResponse, 200);
    });
  }

  void arrangeHttpGetCallWithStatusCodeNot200() {
    when(
      () => mockHTTPClient
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),
    ).thenAnswer((invocation) async {
      return Response('{}', 400);
    });
  }

  group('UserRepository - : ', () {
    group('getUser function - : ', () {
      test('if status code is 200 then a user should be returned', () async {
        //arrange
        arrangeHttpGetCallWithStatusCode200();
        //act
        final user = await userRepository.getUser();
        //assert
        expect(user, isA<User>());
      });

      test('if status code is not 200 then an exception should be thrown',
          () async {
        //arrange
        arrangeHttpGetCallWithStatusCodeNot200();
        //act
        final user =  userRepository.getUser();
        //assert
        expect(user, throwsException);
      });
    });
  });
}
