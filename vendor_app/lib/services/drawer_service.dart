import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/banner_screen.dart';
import 'package:vendor_app/coupon_screen.dart';
import 'package:vendor_app/dashboard_screen.dart';
import 'package:vendor_app/login_screen.dart';
import 'package:vendor_app/product_screen.dart';
import 'package:vendor_app/add_edit_coupon_screen.dart';

class DrawerServices {
  // FirebaseAuth _auth = FirebaseAuth();

  // logOut() async {
  //   return await _auth.signOut();
  // }
  Future _signOut()  async{
    await FirebaseAuth.instance.signOut();

  }
  Widget drawerScreen(title,context) {
    if (title == 'DashBoard') {
      return DashBoardScreen();
    }

    if (title == 'Products') {
      return ProductScreen();
    }
    if (title == 'Banners') {
      return BannerScreen();
    }
    if (title == 'Coupans') {
      return CouponScreen();
    }

    if (title == 'LogOut')
      {
      
        Future.delayed(Duration.zero, ()async {
        await  FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        });
     //   return LoginScreen();


  //     return Navigator();

    }

    return DashBoardScreen();

  }
}
