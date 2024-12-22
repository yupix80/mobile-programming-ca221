import 'dart:developer';

import 'package:dio/dio.dart';
import '../../models/comment.dart';
import '../../core/helpers/dio_interceptor.dart';
import '../../core/resources/constants.dart';
import '../contracts/abs_api_comment_repository.dart';

class ApiCommentRepository extends AbsApiCommentRepository {
  final _baseUri = '$baseUrl/api/moments';
  late Dio _dio;

  ApiCommentRepository() {
    _dio = Dio(BaseOptions(baseUrl: _baseUri));
    _dio.interceptors.add(DioInterceptor(dio: _dio));
  }

  @override
  Future<List<Comment>> getAll([String keyword = '']) async {
    try {
      final response = await _dio.get('/all', queryParameters: {'keyword': keyword});
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => Comment.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:getAll');
    }
    return [];
  }

  @override
  Future<List<Comment>> getWithPagination(
      [int page = 1, int size = 10, String keyword = '']) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'PageNumber': page,
        'PageSize': size,
        'Keyword': keyword,
      });
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((e) => Comment.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:getWithPagination');
    }
    return [];
  }

  @override
  Future<Comment?> getById(String id) async {
    try {
      final response = await _dio.get('/:momentId/comments/$id');
      if (response.statusCode == 200) {
        return Comment.fromMap(response.data);
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:getById');
    }
    return null;
  }

  @override
  Future<Comment?> create(Comment newData) async {
    try {
      final response = await _dio.post('/:momentId/comments', data: newData.toMap());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Comment.fromMap(response.data);
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:create');
    }
    return null;
  }

  @override
  Future<bool> update(Comment updatedData) async {
    try {
      final response = await _dio.put('/${updatedData.momentId}/comments/${updatedData.id}',
          data: updatedData.toMap());
      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:update');
    }
    return false;
  }

  @override
  Future<bool> delete(String id) async {
    try {
      final response = await _dio.delete('/:momentId/comments/$id');
      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:delete');
    }
    return false;
  }
}
