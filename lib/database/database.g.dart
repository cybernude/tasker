// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final bool completed;
  final DateTime dueDate;
  final String tag;
  Task(
      {@required this.id,
      @required this.name,
      @required this.completed,
      this.dueDate,
      this.tag});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      tag: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tag']),
    );
  }
  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      completed: serializer.fromJson<bool>(json['completed']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'completed': serializer.toJson<bool>(completed),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'tag': serializer.toJson<String>(tag),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Task>>(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      tag: tag == null && nullToAbsent ? const Value.absent() : Value(tag),
    ) as T;
  }

  Task copyWith(
          {int id,
          String name,
          bool completed,
          DateTime dueDate,
          String tag}) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        completed: completed ?? this.completed,
        dueDate: dueDate ?? this.dueDate,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('completed: $completed, ')
          ..write('dueDate: $dueDate, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc(
          $mrjc(
              $mrjc($mrjc(0, id.hashCode), name.hashCode), completed.hashCode),
          dueDate.hashCode),
      tag.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == id &&
          other.name == name &&
          other.completed == completed &&
          other.dueDate == dueDate &&
          other.tag == tag);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> completed;
  final Value<DateTime> dueDate;
  final Value<String> tag;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.completed = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.tag = const Value.absent(),
  });
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedDateTimeColumn _dueDate;
  @override
  GeneratedDateTimeColumn get dueDate => _dueDate ??= _constructDueDate();
  GeneratedDateTimeColumn _constructDueDate() {
    return GeneratedDateTimeColumn(
      'due_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tagMeta = const VerificationMeta('tag');
  GeneratedTextColumn _tag;
  @override
  GeneratedTextColumn get tag => _tag ??= _constructTag();
  GeneratedTextColumn _constructTag() {
    return GeneratedTextColumn('tag', $tableName, true,
        $customConstraints: 'NULL REFERENCES tags(name)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, completed, dueDate, tag];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(TasksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.completed.present) {
      context.handle(_completedMeta,
          completed.isAcceptableValue(d.completed.value, _completedMeta));
    } else if (completed.isRequired && isInserting) {
      context.missing(_completedMeta);
    }
    if (d.dueDate.present) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableValue(d.dueDate.value, _dueDateMeta));
    } else if (dueDate.isRequired && isInserting) {
      context.missing(_dueDateMeta);
    }
    if (d.tag.present) {
      context.handle(_tagMeta, tag.isAcceptableValue(d.tag.value, _tagMeta));
    } else if (tag.isRequired && isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TasksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.completed.present) {
      map['completed'] = Variable<bool, BoolType>(d.completed.value);
    }
    if (d.dueDate.present) {
      map['due_date'] = Variable<DateTime, DateTimeType>(d.dueDate.value);
    }
    if (d.tag.present) {
      map['tag'] = Variable<String, StringType>(d.tag.value);
    }
    return map;
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String name;
  final int color;
  Tag({@required this.name, @required this.color});
  factory Tag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Tag(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
    );
  }
  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Tag(
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Tag>>(bool nullToAbsent) {
    return TagsCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    ) as T;
  }

  Tag copyWith({String name, int color}) => Tag(
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc($mrjc(0, name.hashCode), color.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Tag && other.name == name && other.color == color);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> name;
  final Value<int> color;
  const TagsCompanion({
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagsTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, color];
  @override
  $TagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tags';
  @override
  final String actualTableName = 'tags';
  @override
  VerificationContext validateIntegrity(TagsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.color.present) {
      context.handle(
          _colorMeta, color.isAcceptableValue(d.color.value, _colorMeta));
    } else if (color.isRequired && isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Tag map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TagsCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.color.present) {
      map['color'] = Variable<int, IntType>(d.color.value);
    }
    return map;
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as AppDatabase);
  TagDao _tagDao;
  TagDao get tagDao => _tagDao ??= TagDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [tasks, tags];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TaskDaoMixin on DatabaseAccessor<AppDatabase> {
  $TasksTable get tasks => db.tasks;
  $TagsTable get tags => db.tags;
}

mixin _$TagDaoMixin on DatabaseAccessor<AppDatabase> {
  $TagsTable get tags => db.tags;
}
