import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mestorapp/db/db.dart';
import 'package:mestorapp/db/models/database.dart';
import 'package:mestorapp/domain/repositories.dart';

class AppRepo {
  static final AppDatabase db = AppDatabase();
  final ActivityRepository activityRepo;

  AppRepo() : activityRepo = ActivityDbRepository(appDb: db);
}

final appRepoProvider = Provider((ref) {
  return AppRepo();
});
