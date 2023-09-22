import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum CounterAction { increment, decrement }

int counterReducer(int state, CounterAction action) {
  switch (action) {
    case CounterAction.increment:
      return state + 1;
    case CounterAction.decrement:
      return state - 1;
    default:
      return state;
  }
}

class UseReducerPage extends HookWidget {
  const UseReducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = useReducer(counterReducer,
        initialAction: CounterAction.increment, initialState: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('useReducer'),
      ),
      body: Center(
          child: Text(
        counter.state.toString(),
        style: const TextStyle(fontSize: 80),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => counter.dispatch(CounterAction.increment),
          ),
          const SizedBox(width: 20), // space between two buttons
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => counter.dispatch(CounterAction.decrement),
          ),
        ],
      ),
    );
  }
}

// class UseReducerPage extends HookWidget {
//   const UseReducerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var counter = useState(0);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('useReducer'),
//       ),
//       body: Center(
//           child: Text(
//         counter.value.toString(),
//         style: const TextStyle(fontSize: 80),
//       )),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => counter.value++,
//           ),
//           const SizedBox(width: 20), // space between two buttons
//           FloatingActionButton(
//             child: const Icon(Icons.remove),
//             onPressed: () => counter.value--,
//           ),
//         ],
//       ),
//     );
//   }
// }
