import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_animation_page.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_callback.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_effect.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_future.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_memoized.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_reducer.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_scrollcontroller.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_single_ticker_provider_page.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_state.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_stream.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_tab_controller.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_text_editing_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget title(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        '---------- $message ----------',
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  pushPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hook Sample'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  pushPage(context, const UseStatePage());
                },
                child: const Text('useState'),
              ),
              ElevatedButton(
                onPressed: () {
                  pushPage(context, UseEffectPage());
                },
                child: const Text('useEffect'),
              ),
              ElevatedButton(
                onPressed: () {
                  pushPage(context, UseMemoizedPage());
                },
                child: const Text('useMemoized'),
              ),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseCallBackPage());
                  },
                  child: const Text('useCallback')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseStreamPage());
                  },
                  child: const Text('useStream')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseFuturePage());
                  },
                  child: const Text('useFuture')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, useTabControllerPage());
                  },
                  child: const Text('useTabController')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseSingleTickerProviderPage());
                  },
                  child: const Text('useSingleTickerProvider')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseAnimationPage());
                  },
                  child: const Text('useAnimation')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseReducerPage());
                  },
                  child: const Text('useReducer')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseScrollControllerPage());
                  },
                  child: const Text('useScrollController')),
              ElevatedButton(
                  onPressed: () {
                    pushPage(context, UseTextEditingControllerPage());
                  },
                  child: const Text('useTextEditingController')),
            ],
          ),
        ),
      ),
    );
  }
}
