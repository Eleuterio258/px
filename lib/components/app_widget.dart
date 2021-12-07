import 'package:delivery/bloc/index.dart';
import 'package:delivery/pages/order_page.dart';
import 'package:delivery/repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OrderBloc(orderRepository: OrderRepository()),
          ),
        ],
        child: MaterialApp(
          title: 'Order Delivery',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: OrderPage(),
        ));
  }
}
