import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Table Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool purchasebool = false;
  bool sellbool = false;
  bool stockbool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * .8,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35,),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'X',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Demo Limited Company',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      purchasebool = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                        isExpanded: purchasebool,
                        headerBuilder: (context, isExpanded) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: purchasebool ? Colors.teal : Colors.grey,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Purchase',
                                  style: TextStyle(
                                      color: purchasebool
                                          ? Colors.teal
                                          : Colors.grey,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(left: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Purchase List',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.teal),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Order List',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.teal)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Vat List',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.teal)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Product Unit',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.teal)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Purchase Report',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.teal)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    sellbool = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                      isExpanded: sellbool,
                      headerBuilder: (context, isExpanded) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.card_travel_sharp,
                                  color: sellbool ? Colors.teal : Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Sell',
                                  style: TextStyle(
                                      color: sellbool ? Colors.teal : Colors.grey,
                                      fontSize: 18)),
                            ),
                          ],
                        );
                      },
                      body: Column()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    stockbool = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                      isExpanded: stockbool,
                      headerBuilder: (context, isExpanded) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.grid_view,
                                  color: stockbool ? Colors.teal : Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Stock/Inventory',
                                  style: TextStyle(
                                      color:
                                          stockbool ? Colors.teal : Colors.grey,
                                      fontSize: 18)),
                            ),
                          ],
                        );
                      },
                      body: Column()),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.teal)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.teal,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    'Dues',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ColoredBox(
                            color: Colors.teal.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Previous Due  ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('01 January 2022')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ColoredBox(
                      color: Colors.teal.shade50,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .25,
                        decoration:
                            BoxDecoration(border: Border(
                              top: BorderSide(color: Colors.teal),
                                right: BorderSide(color: Colors.teal)
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text(
                            'Due',
                            style: TextStyle(fontSize: 16),
                          ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '৳ 15000',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      decoration:
                          BoxDecoration(border: Border(left: BorderSide(color: Colors.teal))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.teal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Purchase'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.teal))),
                            child: Column(
                              children: [
                                ColoredBox(
                                  color: Colors.teal.shade50,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Invoice Date : '),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('01 january 2022'),
                                      ),
                                    ],
                                  ),
                                ),
                                ColoredBox(
                                  color: Colors.teal.shade50,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Invoice no : '),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('5386328'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(color: Colors.teal))),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('Test product 1'),
                                        subtitle: Text('200 x 300'),
                                      ),
                                      ListTile(
                                        title: Text('Test product 1'),
                                        subtitle: Text('200 x 300'),
                                      ),
                                      ListTile(
                                        title: Text('Test product 1'),
                                        subtitle: Text('200 x 300'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('৳ 6000'),
                                      ),
                                      ListTile(
                                        title: Text('৳ 6000'),
                                      ),
                                      ListTile(
                                        title: Text('৳ 6000'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Vat'),
                                        ),
                                        ListTile(
                                          title: Text('Discount'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Grand Total'),
                                        ),
                                        ListTile(
                                          title: Text('Previous Due'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Total Amount'),
                                        ),
                                        ListTile(
                                          title: Text('Total Payment'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Remaining Balance'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ColoredBox(
                      color: Colors.teal.shade50,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .25,
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.teal)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text(
                            'Due',
                            style: TextStyle(fontSize: 16),
                          ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '৳ 15000',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      decoration:
                          BoxDecoration(border: Border(left: BorderSide(color: Colors.teal))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.teal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Payment'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.teal))),
                            child: Column(
                              children: [
                                ColoredBox(
                                  color: Colors.teal.shade50,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Invoice Date : '),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('01 january 2022'),
                                      ),
                                    ],
                                  ),
                                ),
                                ColoredBox(
                                  color: Colors.teal.shade50,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Invoice no : '),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('5386328'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Vat'),
                                        ),
                                        ListTile(
                                          title: Text('Discount'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Grand Total'),
                                        ),
                                        ListTile(
                                          title: Text('Previous Due'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Total Amount'),
                                        ),
                                        ListTile(
                                          title: Text('Total Payment'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Remaining Balance'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ColoredBox(
                      color: Colors.teal.shade50,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .25,
                        decoration:
                            BoxDecoration(border: Border(
                              left: BorderSide(color: Colors.teal),
                              right: BorderSide(color: Colors.teal),

                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Due',
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '৳ 15000',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      decoration:
                          BoxDecoration(border: Border(
                              left: BorderSide(color: Colors.teal),
                              bottom: BorderSide(color: Colors.teal),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredBox(
                            color: Colors.teal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Return'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.teal))),
                            child: Column(
                              children: [
                                ColoredBox(
                                  color: Colors.teal.shade50,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Invoice Date : '),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('01 january 2022'),
                                      ),
                                    ],
                                  ),
                                ),
                                ColoredBox(
                                  color: Colors.teal.shade50,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Invoice no : '),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('5386328'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(color: Colors.teal))),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('Test product 1'),
                                        subtitle: Text('200 x 300'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('৳ 6000'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Vat'),
                                        ),
                                        ListTile(
                                          title: Text('Discount'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Grand Total'),
                                        ),
                                        ListTile(
                                          title: Text('Previous Due'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Total Amount'),
                                        ),
                                        ListTile(
                                          title: Text('Total Payment'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: Colors.teal))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right:
                                                BorderSide(color: Colors.teal))),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Remaining Balance'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('৳ 0'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ColoredBox(
                      color: Colors.teal.shade50,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .25,
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.teal)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text(
                            'Due',
                            style: TextStyle(fontSize: 16),
                          ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '৳ 15000',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_box),
                          Text('Pay the Balance'),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
