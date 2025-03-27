import 'package:ecommerce/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/mocks.mocks.dart';

void main() {
  late MockInternetConnectionChecker mockChecker;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    mockChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockChecker);
  });

  test('should return true when online', () async {
    // Arrange
    when(mockChecker.hasConnection).thenAnswer((_) async => true);
    
    // Act
    final result = await networkInfo.isConnected;
    
    // Assert
    verify(mockChecker.hasConnection);
    expect(result, true);
  });
}