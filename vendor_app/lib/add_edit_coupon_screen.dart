import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/services/firebase_services.dart';

class AddEditCoupon extends StatefulWidget {
  @override
  _AddEditCouponState createState() => _AddEditCouponState();
}

class _AddEditCouponState extends State<AddEditCoupon> {
  FirebaseServices _services=FirebaseServices();
  final _formkey =GlobalKey<FormState>();
  DateTime _selectedDate =DateTime.now();
  var dateText=TextEditingController();
  bool _active =false;
  var titleText=TextEditingController();
  var detailsText=TextEditingController();
  var discountRate=TextEditingController();


  _selectDate(context)async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now() ,
        firstDate:DateTime.now() ,
        lastDate:DateTime(2050) ,
    );

    if(picked !=null && picked != _selectedDate)
      {
        setState(() {
          _selectedDate=picked;
          String formattedText= DateFormat('yyy-MM-dd').format(_selectedDate);
          dateText.text = formattedText;
        });
      }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleText,
                validator: (value){
                  if(value.isEmpty){
                    return 'Enter coupon title';
                  }
                  return null;

                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText:'Coupon Title',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
              TextFormField(
                controller: discountRate,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.isEmpty){
                    return 'Enter Discount %';
                  }
                  return null;

                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText:'Discount %',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller:dateText ,
          validator: (value){
            if(value.isEmpty){
              return 'Apply Expiry date';
            }
            return null;

          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            labelText:'Expiry date',
            labelStyle: TextStyle(color: Colors.grey),
            suffixIcon: InkWell(
              onTap: (){
                _selectDate(context);
              },
                child: Icon(Icons.date_range_outlined),),
          ),
        ),
              TextFormField(
                controller: detailsText,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value.isEmpty){
                    return 'Enter Coupon Details';
                  }
                  return null;

                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText:'Coupon Details',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
             SwitchListTile(
               activeColor: Theme.of(context).primaryColor,
               contentPadding: EdgeInsets.zero,
               title: Text('Active Coupon'),
                 value: _active,
               onChanged: (bool newValue) {
                 setState(() {
                   _active=!_active;
                 });

               },

             ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        if(_formkey.currentState.validate()){
                          EasyLoading.show(status:'please wait...');
                          _services.saveCoupon(
                            title: titleText.text.toUpperCase(),
                            details: detailsText.text,
                            discountRate:int.parse(discountRate.text),
                            expiry:_selectedDate,
                            active: _active,
                          ).then((value) {
                            setState(() {
                              titleText.clear();
                              discountRate.clear();
                              detailsText.clear();
                              _active=false;
                            });

                            EasyLoading.showSuccess('Saved Coupon successfully');


                          });
                        }
                      },
                      child: Text('Submit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),





            ],
          ),
        ),

      ),

    );
  }
}
