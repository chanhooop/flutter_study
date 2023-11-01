import 'package:api_example/common/model/cursor_pagination_model.dart';
import 'package:api_example/common/model/model_with_id.dart';
import 'package:api_example/common/model/pagination_param.dart';

abstract class IBasePaginationRepository<T extends IModelWithId> {
  Future<CursorPagination<T>> paginate(
      {PaginationParams? paginationParams = const PaginationParams()});
}
