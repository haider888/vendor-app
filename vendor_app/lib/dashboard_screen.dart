import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            subtitle: FlatButton.icon(
              onPressed: (){},
              icon: Icon(null),
              label: Text(' RS. 12,000',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.teal)),
            ),
            title: Text(
              'Revenue',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, color: Colors.grey),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Center(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_bag),
                              label: Expanded(
                                child: Text("Active Orders",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )),
                          subtitle: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Center(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart),
                              label: Expanded(
                                child: Text(" Total Orders",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )),
                          subtitle: Text(
                            '120',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Center(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.grain),
                              label: Text("Producs",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          subtitle: Text(
                            '10',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Center(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.track_changes),
                              label: Text("Reports",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          subtitle: Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Center(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.notifications),
                              label: Expanded(
                                child: Text("Notifications",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )),
                          subtitle: Text(
                            '10',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
