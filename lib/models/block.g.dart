// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlockCollection on Isar {
  IsarCollection<Block> get blocks => this.collection();
}

const BlockSchema = CollectionSchema(
  name: r'Block',
  id: -1408548915874355664,
  properties: {
    r'blockContent': PropertySchema(
      id: 0,
      name: r'blockContent',
      type: IsarType.string,
    ),
    r'blockType': PropertySchema(
      id: 1,
      name: r'blockType',
      type: IsarType.string,
    ),
    r'contentId': PropertySchema(
      id: 2,
      name: r'contentId',
      type: IsarType.long,
    )
  },
  estimateSize: _blockEstimateSize,
  serialize: _blockSerialize,
  deserialize: _blockDeserialize,
  deserializeProp: _blockDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _blockGetId,
  getLinks: _blockGetLinks,
  attach: _blockAttach,
  version: '3.1.0+1',
);

int _blockEstimateSize(
  Block object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.blockContent.length * 3;
  bytesCount += 3 + object.blockType.length * 3;
  return bytesCount;
}

void _blockSerialize(
  Block object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.blockContent);
  writer.writeString(offsets[1], object.blockType);
  writer.writeLong(offsets[2], object.contentId);
}

Block _blockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Block();
  object.blockContent = reader.readString(offsets[0]);
  object.blockType = reader.readString(offsets[1]);
  object.contentId = reader.readLong(offsets[2]);
  object.id = id;
  return object;
}

P _blockDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blockGetId(Block object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blockGetLinks(Block object) {
  return [];
}

void _blockAttach(IsarCollection<dynamic> col, Id id, Block object) {
  object.id = id;
}

extension BlockQueryWhereSort on QueryBuilder<Block, Block, QWhere> {
  QueryBuilder<Block, Block, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BlockQueryWhere on QueryBuilder<Block, Block, QWhereClause> {
  QueryBuilder<Block, Block, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Block, Block, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Block, Block, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Block, Block, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BlockQueryFilter on QueryBuilder<Block, Block, QFilterCondition> {
  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockType',
        value: '',
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> blockTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockType',
        value: '',
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> contentIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> contentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> contentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> contentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Block, Block, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BlockQueryObject on QueryBuilder<Block, Block, QFilterCondition> {}

extension BlockQueryLinks on QueryBuilder<Block, Block, QFilterCondition> {}

extension BlockQuerySortBy on QueryBuilder<Block, Block, QSortBy> {
  QueryBuilder<Block, Block, QAfterSortBy> sortByBlockContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockContent', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> sortByBlockContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockContent', Sort.desc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> sortByBlockType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockType', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> sortByBlockTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockType', Sort.desc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> sortByContentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentId', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> sortByContentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentId', Sort.desc);
    });
  }
}

extension BlockQuerySortThenBy on QueryBuilder<Block, Block, QSortThenBy> {
  QueryBuilder<Block, Block, QAfterSortBy> thenByBlockContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockContent', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenByBlockContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockContent', Sort.desc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenByBlockType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockType', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenByBlockTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockType', Sort.desc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenByContentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentId', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenByContentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentId', Sort.desc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Block, Block, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension BlockQueryWhereDistinct on QueryBuilder<Block, Block, QDistinct> {
  QueryBuilder<Block, Block, QDistinct> distinctByBlockContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Block, Block, QDistinct> distinctByBlockType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Block, Block, QDistinct> distinctByContentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentId');
    });
  }
}

extension BlockQueryProperty on QueryBuilder<Block, Block, QQueryProperty> {
  QueryBuilder<Block, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Block, String, QQueryOperations> blockContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockContent');
    });
  }

  QueryBuilder<Block, String, QQueryOperations> blockTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockType');
    });
  }

  QueryBuilder<Block, int, QQueryOperations> contentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentId');
    });
  }
}
