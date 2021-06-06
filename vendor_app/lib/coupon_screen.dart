import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/services/firebase_services.dart';
import 'package:intl/intl.dart';
class CouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: _services.coupons.where(
              'sellerid', isEqualTo: _services.user.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return Center(child: Text('No coupon Add yet'),);
            }

            return new Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Theme
                            .of(context)
                            .primaryColor,


                        child: Text('Add new Coupon', style: TextStyle(
                            color: Colors.white),),),
                    ),
                  ],
                ),

                DataTable(columns: <DataColumn>[
                  DataColumn(label: Text('Title'),),
                  DataColumn(label: Text('Rate'),),
                  DataColumn(label: Text('Status'),),
                  DataColumn(label: Text('Info'),),
                   DataColumn(label: Text('Expiry'),),
                ], rows: _couponList(snapshot.data, context),),

              ],

            );
          },
        ),
      ),
    );
  }

   List<DataRow> _couponList(QuerySnapshot snapshot,context) {
     List<DataRow> newList = snapshot.docs.map((DocumentSnapshot document) {
       if (document != null){
         var date = document.data()['Expiry'];
       var expiry = DateFormat.yMMMd().add_jm().format(date.toDate(),);
       return DataRow(cells: [
         DataCell(Text(document.data()['title'])),
         DataCell(Text(document.data()['discountRate'].toString())),
         DataCell(Text(document.data()['active'] ? 'Active' : 'Inactive')),
         DataCell(Text(expiry.toString()),),
         DataCell(IconButton(
           icon: Icon(Icons.info_outline_rounded),
           onPressed: () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CouponScreen(),),);
           },
         )),

       ],);
     }
     },
     ).toList();
     return newList;




  }
}
