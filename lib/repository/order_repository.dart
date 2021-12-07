import 'package:delivery/models/order.dart';
import 'package:dio/dio.dart';

class OrderRepository implements IOrderRepository {
  final dio = Dio();
  @override
  Future<List<Order>> getOrders() async {
    final response = await dio.get(
        "http://192.168.43.204/2021/11-Job/quickbuystore/public/api/orderdetalhe");
    try {
      return (response.data as List)
          .map((order) => Order.fromJson(order))
          .toList();
    } on DioError catch (dioError) {
      return dioError.response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<Order> getOrder(int id) async {
    try {
      final response = await dio.get('/orders/$id');
      return Order.fromJson(response.data);
    } on DioError catch (dioError) {
      return dioError.response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<Order> updateOrder(Order order) async {
    try {
      final response = await dio.put('/orders/${order.id}', data: order.status);
      return Order.fromJson(response.data);
    } on DioError catch (dioError) {
      return dioError.response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

abstract class IOrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> getOrder(int id);
  Future<Order> updateOrder(Order order);
}
