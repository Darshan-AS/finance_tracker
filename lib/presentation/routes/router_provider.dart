import 'package:finance_tracker/presentation/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final routerProvider = Provider((ref) {
  return AppRouter();
});
