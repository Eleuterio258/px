import 'package:delivery/bloc/index.dart';
import 'package:delivery/components/mini_profile_componts.dart';
import 'package:delivery/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderBloc orderBloc;

  @override
  void initState() {
    orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.add(FetchOrderEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Delivery App"),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.of(context);
            },
          ),
           IconButton(
            icon: Icon(Icons.vpn_key),
            onPressed: () {
              Navigator.of(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          MiniProfileComponts(),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderInitialState) {
                return buildLoading();
              }
              if (state is OrderLoadingState) {
                return buildLoading();
              }
              if (state is OrderLoadedState) {
                return buildList(state.orders);
              }
              if (state is OrderErrorState) {
                return buildError(state.message);
              } else {
                return buildLoading();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget buildList(List<Order> orders) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, int i) {
          return Column(
            children: [
              SizedBox(height: 5),
              Card(
                shadowColor: Colors.green,
                child: InkWell(
                  onTap: () {
                    // nevegarTela(context, 'Order');
                    // Navigator.of(context).pushNamed('Order');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart_sharp,color:Colors.redAccent),
                        SizedBox(width: 35),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Price: ${orders[i].totalPrice} mts"),
                            Row(
                              children: [
                                Text("Name: "),
                                Text("${orders[i].fname} ${orders[i].lname}",
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),
                            Text(
                              "${orders[i].createdAt.toString()}",
                            ),
                            Row(
                              children: [
                                Text("Status: "),
                                Text("${orders[i].status}",
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),
                            Row(
                              children: [
                                Text("Order Tacking: "),
                                Text("${orders[i].orderTacking.toString().toUpperCase()}",
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),Row(
                              children: [
                                Text("Order Phone: "),
                                Text("${orders[i].phone.toString().toUpperCase()}",
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
