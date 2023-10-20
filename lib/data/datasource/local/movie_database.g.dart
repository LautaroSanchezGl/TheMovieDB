// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMovieDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieDatabaseBuilder databaseBuilder(String name) =>
      _$MovieDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MovieDatabaseBuilder(null);
}

class _$MovieDatabaseBuilder {
  _$MovieDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MovieDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MovieDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MovieDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MovieDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MovieDatabase extends MovieDatabase {
  _$MovieDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  GenreDao? _genreDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`voteCount` INTEGER NOT NULL, `video` INTEGER NOT NULL, `popularity` REAL NOT NULL, `originalLanguage` TEXT NOT NULL, `id` INTEGER NOT NULL, `adult` INTEGER NOT NULL, `title` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `genres` TEXT NOT NULL, `posterPath` TEXT NOT NULL, `backdropPath` TEXT NOT NULL, `releaseDate` TEXT NOT NULL, `voteAverage` REAL NOT NULL, `overview` TEXT NOT NULL, `categories` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Genre` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }

  @override
  GenreDao get genreDao {
    return _genreDaoInstance ??= _$GenreDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'voteCount': item.voteCount,
                  'video': item.video ? 1 : 0,
                  'popularity': item.popularity,
                  'originalLanguage': item.originalLanguage,
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'title': item.title,
                  'originalTitle': item.originalTitle,
                  'genres': _listIntConverter.encode(item.genres),
                  'posterPath': item.posterPath,
                  'backdropPath': item.backdropPath,
                  'releaseDate': item.releaseDate,
                  'voteAverage': item.voteAverage,
                  'overview': item.overview,
                  'categories': _listStringConverter.encode(item.categories)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Future<List<Movie>> getMovies(String category) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Movie where categories LIKE \'%\' || ?1 || \'%\'',
        mapper: (Map<String, Object?> row) => Movie(
            voteCount: row['voteCount'] as int,
            video: (row['video'] as int) != 0,
            popularity: row['popularity'] as double,
            originalLanguage: row['originalLanguage'] as String,
            id: row['id'] as int,
            adult: (row['adult'] as int) != 0,
            title: row['title'] as String,
            originalTitle: row['originalTitle'] as String,
            genres: _listIntConverter.decode(row['genres'] as String),
            posterPath: row['posterPath'] as String,
            backdropPath: row['backdropPath'] as String,
            releaseDate: row['releaseDate'] as String,
            voteAverage: row['voteAverage'] as double,
            overview: row['overview'] as String,
            categories:
                _listStringConverter.decode(row['categories'] as String)),
        arguments: [category]);
  }

  @override
  Future<Movie?> existsById(int id) async {
    return _queryAdapter.query('SELECT * FROM Movie where id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            voteCount: row['voteCount'] as int,
            video: (row['video'] as int) != 0,
            popularity: row['popularity'] as double,
            originalLanguage: row['originalLanguage'] as String,
            id: row['id'] as int,
            adult: (row['adult'] as int) != 0,
            title: row['title'] as String,
            originalTitle: row['originalTitle'] as String,
            genres: _listIntConverter.decode(row['genres'] as String),
            posterPath: row['posterPath'] as String,
            backdropPath: row['backdropPath'] as String,
            releaseDate: row['releaseDate'] as String,
            voteAverage: row['voteAverage'] as double,
            overview: row['overview'] as String,
            categories:
                _listStringConverter.decode(row['categories'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }
}

class _$GenreDao extends GenreDao {
  _$GenreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genreInsertionAdapter = InsertionAdapter(
            database,
            'Genre',
            (Genre item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Genre> _genreInsertionAdapter;

  @override
  Future<List<Genre>> getGenreByIds(List<int> ids) async {
    const offset = 1;
    final _sqliteVariablesForIds =
        Iterable<String>.generate(ids.length, (i) => '?${i + offset}')
            .join(',');
    return _queryAdapter.queryList(
        'Select * from Genre where id in (' + _sqliteVariablesForIds + ')',
        mapper: (Map<String, Object?> row) =>
            Genre(id: row['id'] as int, name: row['name'] as String),
        arguments: [...ids]);
  }

  @override
  Future<void> addGenre(Genre genre) async {
    await _genreInsertionAdapter.insert(genre, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _listIntConverter = ListIntConverter();
final _listStringConverter = ListStringConverter();
