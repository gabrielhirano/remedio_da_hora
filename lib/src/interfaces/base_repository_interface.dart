abstract class BaseRepository<Generic> {
  Future get(String id);
  Future<List> getAll();
  Future post(String id, Generic value);
  Future put(String id, Generic value);
  Future delete(String id);
}

