library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:shopping/model/products.dart';

import 'app_state.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[AppState, Products])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
