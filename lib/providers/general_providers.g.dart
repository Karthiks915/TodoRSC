// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosHash() => r'1e925803818365e0bf1458de7cb019621b0dc753';

/// See also [todos].
@ProviderFor(todos)
final todosProvider = AutoDisposeStreamProvider<List<dynamic>>.internal(
  todos,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRef = AutoDisposeStreamProviderRef<List<dynamic>>;
String _$todoControllerHash() => r'de6e69c7e2a8e593a707738310abdd6790d1c82d';

/// See also [todoController].
@ProviderFor(todoController)
final todoControllerProvider = AutoDisposeProvider<TodoController>.internal(
  todoController,
  name: r'todoControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoControllerRef = AutoDisposeProviderRef<TodoController>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
