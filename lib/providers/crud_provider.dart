import 'package:flutter_mysql_crud/providers/crud_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final crudProvider =
    StateNotifierProvider<CrudNotifier, Crud>((ref) => CrudNotifier());
