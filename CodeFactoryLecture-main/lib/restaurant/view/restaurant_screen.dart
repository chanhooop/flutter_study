import 'package:api_example/restaurant/component/restaurant_card.dart';
import 'package:api_example/restaurant/model/restaurant_model.dart';
import 'package:api_example/restaurant/repository/restaurant_repository.dart';
import 'package:api_example/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../../common/model/cursor_pagination_model.dart';
import '../component/restaurant_card.dart';
import '../provider/restaurant_provider.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(scrollListener);
  }

  void scrollListener() {
    // 현재 위치가 최대 길이보다 조금 덜 되는 위치까지 왔다면
    // 새로운 데이터를 추가 요청한다
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      print('fetching!');
      ref.read(restaurantProvider.notifier).paginate(
            fetchMore: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restaurantProvider);

    //완전히 처음 로딩
    if (data is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    //오류 화면
    if (data is CursorPaginationError) {
      return Center(child: Text(data.message));
    }

    // 남은 상태
    // CursorPagination,
    // CursorPaginationFetchingMore,
    // CursorPaginationRefetching,
    // 세가지 상태는 모두 CursorPagination 을 상속받은 자식이다. (meta,data 속성이 존재함)

    final cp = data as CursorPagination;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemCount: cp.data.length + 1,
        itemBuilder: (_, index) {
          if (index == cp.data.length) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Center(
                child: data is CursorPaginationFetchingMore
                    ? CircularProgressIndicator()
                    : Text("마지막 데이터입니다!"),
              ),
            );
          }
          final pItem = cp.data[index];
          // final pItem = RestaurantModel.fromJson(item);
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RestaurantDetailScreen(
                      id: pItem.id,
                    ),
                  ),
                );
              },
              child: RestaurantCard.fromModel(model: pItem));
        },
        separatorBuilder: (_, index) => const SizedBox(height: 16),
      ),
    );
  }
}
