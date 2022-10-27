import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/components/appbar.dart';
import 'package:login/components/orders/order_card.dart';
import 'package:http/http.dart' as http;

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final GlobalKey<FormState> _formKeyOrderList = GlobalKey<FormState>();
  var listData = [];

  @override
  void initState() {
    super.initState();
    _getOrderList();
  }

  Future<http.Response> _getOrderList() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    listData = jsonDecode(response.body);
    return response;
  }

  // Future<http.Response> _getOrderList() async {
  //   SharedPreferences riderToken = await SharedPreferences.getInstance();
  //   riderToken.setBool('login', true);
  //   var orderList;
  //   final response = await http.get(
  //     // Uri.parse('https://35.171.26.170/api/order_handle/list'),
  //     // headers: {'x-authtoken': riderToken.getString('riderToken').toString()},
  //     Uri.parse('https://gorest.co.in/public/v1/users'),
  //   );
  //   if (response.statusCode == 200) {
  //     orderList = jsonDecode(response.body) as List;
  //     listData = orderList;
  //   }
  //   return response;
  // }

  // Future<http.Response> _confirmOrder(String orderid) async {
  //   SharedPreferences riderToken = await SharedPreferences.getInstance();
  //   final url = 'https://35.171.26.170/api/order_handle/confirmed/' + orderid;
  //   final response = await http.get(
  //     Uri.parse('https://35.171.26.170/api/order_handle/confirmed/' + orderid),
  //     headers: {
  //       'x-authtoken': riderToken.getString('riderToken').toString(),
  //       "Content-Type": "application/json"
  //     },
  //   );
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          topBar(size, "ORDERS"),
          const SizedBox(height: 10),
          Expanded(
            child: Form(
              key: _formKeyOrderList,
              child: FutureBuilder(
                future: _getOrderList(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        size: size,
                        contact: listData[index]["title"].substring(0, 10),
                        address: listData[index]["title"].substring(0, 10),
                        orderid: listData[index]["title"].substring(0, 10),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
