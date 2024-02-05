import '../model/note_item.dart';

abstract interface class NoteRepository {
  Future<List<NoteItem>> getNotes();

  Future<NoteItem?> getNoteById({required int id});

  Future<void> insertNote({required NoteItem noteItem});

  Future<void> updateNote({required NoteItem noteItem});

  Future<void> deleteNote({required NoteItem noteItem});
}
