import 'package:equatable/equatable.dart';

class OrderEvent extends Equatable {
  @override
  List<Object> get props => throw [];
}

class FetchOrderEvent extends OrderEvent {}

class FetchOrderByUserEvent extends OrderEvent {}

class FetchOrderByIdEvent extends OrderEvent {}

class FetchOrderByStatusEvent extends OrderEvent {}

class UpdateStatusOrderEvent extends OrderEvent {}
