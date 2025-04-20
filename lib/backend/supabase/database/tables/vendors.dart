import '../database.dart';

class VendorsTable extends SupabaseTable<VendorsRow> {
  @override
  String get tableName => 'vendors';

  @override
  VendorsRow createRow(Map<String, dynamic> data) => VendorsRow(data);
}

class VendorsRow extends SupabaseDataRow {
  VendorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get booth => getField<int>('booth');
  set booth(int? value) => setField<int>('booth', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  dynamic get categories => getField<dynamic>('categories');
  set categories(dynamic value) => setField<dynamic>('categories', value);

  String? get logourl => getField<String>('logourl');
  set logourl(String? value) => setField<String>('logourl', value);
}
