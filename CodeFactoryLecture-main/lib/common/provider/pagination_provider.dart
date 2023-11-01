import 'package:api_example/common/model/model_with_id.dart';
import 'package:api_example/common/repository/base_pagination_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/cursor_pagination_model.dart';
import '../model/pagination_param.dart';

class PaginationProvider<
T extends IModelWithId,
U extends IBasePaginationRepository<T>
> extends StateNotifier<CursorPaginationBase> {
  final U repository;

  PaginationProvider({required this.repository})
      : super(CursorPaginationLoading());

  Future<void> paginate({
    int fetchCount = 20,
    //fetchMore는 기존 데이터를 보여주며 가져오고, forceRefetch는 그냥 페이지 전체 로딩
    bool fetchMore = false, // true면 추가 데이터 가져옴, false면 새로고침 (현재 상태 덮어씌우기)
    bool forceRefetch = false, //true면 CursorPaginationLoading()
  }) async {
    try {
      //state의 다섯가지 상태

      // 1. CursorPagination - 정상적으로 데이터가 있을 때

      // 2. CursorPaginationLoading - 데이터가 로딩중 (현재 캐시없음)

      // 3. CursorPaginationError - 에러 상태

      // 4. CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가져올때

      // 5. CursorPaginationFetchMore - 추가 데이터를 paginate 요청 받았을 때

      //바로 return하는 상황
      // hasMore = false (페이지네이션을 최소 한번은 한 상태)
      // 로딩 중 fetchMore = true
      // fetchMore = false -> 새로고침의 의도

      //정상 페이지네이션 상태
      if (state is CursorPagination && !forceRefetch) {
        final pState = state as CursorPagination;

        if (!pState.meta.hasMore) {
          return; //no more data, 요청하지 않음
        }
      }

      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      //create pagination params
      PaginationParams paginationParams = PaginationParams(
        count: fetchCount,
      );

      //데이터를 추가로 가져오는 상황
      if (fetchMore) {
        final pState = state as CursorPagination<T>; //조심해서 사용, T타입에는 Rating Model, Restaurant Model등을 넣을 수 있다

        state = CursorPaginationFetchingMore(
          meta: pState.meta,
          data: pState.data,
        ); //meta와 data는 유지하고, 상태만 변경할 수 있다. 일단 상태 먼저 변경해서 ui상에서 로딩 효과를 나타내거나 할 수 있음.

        paginationParams = paginationParams.copyWith(
          after: pState.data.last.id,
        ); //after에 마지막 데이터의 아이디를 넣어준다.
      }

      //데이터를 처음부터 가져오는 상황
      else {
        //만약 데이터가 있는 상황이라면 기존 데이터를 보존한 채로 fetch(api 요청)을 진행
        if (state is CursorPagination && !forceRefetch) {
          //forceRefetch는 처음부터 불러오는 명령이기 때문에 해당 상황에서는 false여야 한다.
          final pState = state as CursorPagination<T>;

          state = CursorPaginationRefetching(
            meta: pState.meta,
            data: pState.data,
          );
        }
        //나머지 상황
        else {
          state = CursorPaginationLoading();
        }
      }

      final resp = await repository.paginate(
        paginationParams: paginationParams,
      ); // 데이터 요청하기

      if (state is CursorPaginationFetchingMore) {
        final pState = state as CursorPaginationFetchingMore<T>;

        //기존 데이터에 새 데이터 추가
        state = resp.copyWith(data: [
          ...pState.data,
          ...resp.data,
        ]);
      } else {
        //CursorPaginationFetchingMore이 아닌 상황 => loading or refetching 상황 => 그냥 resp넣기, 가장 처음 페이지에 대한 응답값이므로
        state = resp;
      }
    } catch (e) {
      //에러 상황
      state = CursorPaginationError(message: '데이터를 가져오지 못했습니다.');
    }
  }
}
