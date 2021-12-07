import 'package:bloc/bloc.dart';
import 'package:delivery/bloc/index.dart';
import 'package:delivery/models/order.dart';
import 'package:delivery/repository/order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;
  OrderBloc({OrderState initialState, this.orderRepository})
      : super(initialState);

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is FetchOrderEvent) {
      yield OrderLoadingState();

      try {
        List<Order> orders = await orderRepository.getOrders();
        yield OrderLoadedState(orders: orders);
      } catch (e) {
        yield OrderErrorState(message: e.toString());
      }
    }
  }
}
