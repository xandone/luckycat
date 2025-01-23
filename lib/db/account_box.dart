

import 'package:luckycat/db/account_dao.dart';
import 'package:objectbox/objectbox.dart';

import '../objectbox.g.dart';

class AccountBox {
  /// A Box of notes.
  late final Box<AccountDao> _noteBox;

  void initBox(Box<AccountDao> box) {
    this._noteBox = box;
  }

  Stream<List<AccountDao>> getNotes() {
    // Query for all notes, sorted by their date.
    // https://docs.objectbox.io/queries
    final builder =
        _noteBox.query().order(AccountDao_.id, flags: Order.descending);
    // Build and watch the query,
    // set triggerImmediately to emit the query immediately on listen.
    return builder
        .watch(triggerImmediately: true)
        // Map it to a list of notes to be used by a StreamBuilder.
        .map((query) => query.find());
  }

  /// Add a note.
  ///
  /// To avoid frame drops, run ObjectBox operations that take longer than a
  /// few milliseconds, e.g. putting many objects, asynchronously.
  /// For this example only a single object is put which would also be fine if
  /// done using [Box.put].
  Future<void> addNote(AccountDao bean) => _noteBox.putAsync(bean);

  Future<void> removeNote(int id) => _noteBox.removeAsync(id);

  Future<AccountDao?> readNote(int id) {
    return _noteBox.getAsync(id);
  }
}
