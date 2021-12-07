// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
    Order({
        this.id,
        this.userId,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.address,
        this.city,
        this.province,
        this.postalcode,
        this.totalPrice,
        this.status,
        this.orderTacking,
        this.frete,
        this.subtotal,
        this.createdAt,
        this.updatedAt,
        this.deliveryId,
    });

    int id;
    int userId;
    String fname;
    String lname;
    String email;
    String phone;
    String address;
    String city;
    String province;
    String postalcode;
    int totalPrice;
    String status;
    String orderTacking;
    String frete;
    String subtotal;
    DateTime createdAt;
    DateTime updatedAt;
    int deliveryId;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        postalcode: json["postalcode"],
        totalPrice: json["total_price"],
        status: json["status"],
        orderTacking: json["order_tacking"],
        frete: json["frete"],
        subtotal: json["subtotal"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deliveryId: json["delivery_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "address": address,
        "city": city,
        "province": province,
        "postalcode": postalcode,
        "total_price": totalPrice,
        "status": status,
        "order_tacking": orderTacking,
        "frete": frete,
        "subtotal": subtotal,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "delivery_id": deliveryId,
    };
}
