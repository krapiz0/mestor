import 'package:nanoid2/nanoid2.dart';
import 'package:mestorapp/db/models/models.dart';
import 'package:mestorapp/domain/models/models.dart';
import 'package:mestorapp/domain/repositories.dart';
import 'package:mestorapp/domain/types.dart';

class ActivityDbRepository extends ActivityRepository {
  final AppDatabase appDb;

  ActivityDbRepository({required this.appDb});

  @override
  Future<List<Activity>> getActivities() async {
    final query = appDb.select(appDb.activityDb);
    query.where((a) => a.deletedAt.isNull());

    final dbActs = await query.get();
    final acts = dbActs.map((act) {
      return Activity(
        id: act.id,
        name: act.name,
        color: act.color,
        emoji: act.emoji,
        createAt: act.createdAt,
        deletedAt: act.deletedAt,
      );
    }).toList();
    return Future.value(acts);
  }

  @override
  Future<void> saveActivity(NewActivityData data) async {
    await appDb.into(appDb.activityDb).insert(ActivityDbCompanion.insert(
          id: nanoid(),
          name: data.name,
          color: data.color,
          emoji: data.emoji,
          createdAt: DateTime.now(),
        ));
  }
}
