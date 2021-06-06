import 'package:flutter/material.dart';
import 'package:vendor_app/widgets/publish_product.dart';
import 'package:vendor_app/widgets/unpublish_product.dart';

import 'add_new_productscreen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text('Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black54,
                          maxRadius: 13,
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '20',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(
                        'Add New',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.teal,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewProduct()),
                        );
                      })
                ],
              ),
              TabBar(
                  indicatorColor: Colors.teal,
                  indicatorWeight: 2,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Published',
                    ),
                    Tab(
                      text: 'Un-Published',
                    ),
                  ]),
              Expanded(
                  child: TabBarView(
                children: [
                  PublishProduct(),
                  UnPublishProduct(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
