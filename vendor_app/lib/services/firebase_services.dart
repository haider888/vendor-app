import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  User user = FirebaseAuth.instance.currentUser;
  CollectionReference category = FirebaseFirestore.instance.collection('categories');
  CollectionReference product = FirebaseFirestore.instance.collection('products');
  CollectionReference vendorBanner = FirebaseFirestore.instance.collection('vendorBanner');
  CollectionReference coupons = FirebaseFirestore.instance.collection('coupons');

  Future<void> publishProduct({id}) {
    return product.doc(id).update({'published': true});
  }

  Future<void> unpublishProduct({id}) {
    return product.doc(id).update({'published': false});
  }

  Future<void> deleteProduct({id}) {
    return product.doc(id).delete();
  }

  Future<void> addBannerToFirebase(url) {
    return vendorBanner.add({'imageUrl': url, 'sellerId': user.uid});
  }

  Future<void> deleteBannerToFirebase({id}) {
    return vendorBanner.doc(id).delete();
  }

  Future<void>saveCoupon ({title,discountRate,expiry,details,active}) {
    return coupons.doc(title).set({
      'title': title,
      'discountRate':discountRate,
      'Expiry':expiry,
      'details':details,
      'active':active,
      'sellerid':user.uid,


    });
  }
}
