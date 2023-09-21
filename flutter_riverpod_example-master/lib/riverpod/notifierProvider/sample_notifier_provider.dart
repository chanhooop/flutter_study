import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleNotifierProvider =
    NotifierProvider<CounterNotifier, Model>(CounterNotifier.new);

// final counterProvider = NotifierProvider<Counter, int>(() {
//   return Counter();
// });

// ------------------------------------------------------------------------------

/// controller
class CounterNotifier extends Notifier<Model> {
  @override
  Model build() {
    return Model();
  }

  void updateBoolData() {
    state = state.copyWith(boolData: !state.boolData);
  }

  void updateIntData() {
    state = state.copyWith(intData: state.intData + 1);
  }

  void updateStringData() {
    state = state.copyWith(stringData: '${state.stringData}1');
  }

  void updateListData() {
    state = state.copyWith(listData: [...state.listData, '2']);
  }
}

/// model
class Model {
  final bool boolData;
  final int intData;
  final String stringData;
  final List<String> listData;

  Model({
    this.boolData = false,
    this.intData = 0,
    this.stringData = '',
    this.listData = const [],
  });

  Model copyWith({
    bool? boolData,
    int? intData,
    String? stringData,
    List<String>? listData,
  }) {
    return Model(
      boolData: boolData ?? this.boolData,
      intData: intData ?? this.intData,
      stringData: stringData ?? this.stringData,
      listData: listData ?? this.listData,
    );
  }
}
