// import 'package:flutter_test/flutter_test.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:your_project/presentation/auth/cubit/auth_cubit.dart';
//
// void main() {
//   blocTest<AuthCubit, AuthState>(
//     'emits [Loading, Success] when login succeeds',
//     build: () => AuthCubit(MockLoginUsecase()),
//     act: (cubit) => cubit.login("user", "pass"),
//     expect: () => [
//       AuthLoading(),
//       AuthSuccess(),
//     ],
//   );
// }