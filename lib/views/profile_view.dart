// import 'package:flutter/material.dart';
// import '../models/user_model.dart';
// import '../services/menu_service.dart';

// class ProfileView extends StatefulWidget {
//   final UserModel userModel;
//   final double frontSize = 15, gapBetweenText = 2, headerHeight = 70;

//   const ProfileView({super.key, required this.userModel});

//   @override
//   _ProfileViewState createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   late Future<List<String>> menuItems;

//   @override
//   void initState() {
//     super.initState();
//     menuItems = MenuService().fetchMenu();

//     // Print menu items to console
//     menuItems.then((items) {
//       print("Menu Items: $items");
//     }).catchError((error) {
//       print("Error fetching menu: $error");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Employee Profile"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: widget.headerHeight,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 100,
//                     width: 100,
//                     child: FlutterLogo(size: isSmallScreen ? 100 : 200),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${widget.userModel.firstName} ${widget.userModel.lastName}',
//                         style: TextStyle(
//                             fontSize: widget.frontSize,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: widget.gapBetweenText),
//                       Text(
//                         widget.userModel.email,
//                         style: TextStyle(
//                             fontSize: widget.frontSize,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: widget.gapBetweenText),
//                       Text(
//                         widget.userModel.phone,
//                         style: TextStyle(
//                             fontSize: widget.frontSize,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Menu List",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Expanded(
//               child: FutureBuilder<List<String>>(
//                 future: menuItems,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text("Error: ${snapshot.error}"));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text("No menu items available"));
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(snapshot.data![index]),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/menu_service.dart';

class ProfileView extends StatefulWidget {
  final UserModel userModel;
  final double frontSize = 15, gapBetweenText = 2, headerHeight = 70;

  const ProfileView({super.key, required this.userModel});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<List<Map<String, dynamic>>> menuItems;

  @override
  void initState() {
    super.initState();
    menuItems = MenuService().fetchMenu();

    // Print menu items to console
    menuItems.then((items) {
      print("Menu Items: $items");
    }).catchError((error) {
      print("Error fetching menu: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.headerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: FlutterLogo(size: isSmallScreen ? 100 : 200),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.userModel.firstName} ${widget.userModel.lastName}',
                        style: TextStyle(
                            fontSize: widget.frontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: widget.gapBetweenText),
                      Text(
                        widget.userModel.email,
                        style: TextStyle(
                            fontSize: widget.frontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: widget.gapBetweenText),
                      Text(
                        widget.userModel.phone,
                        style: TextStyle(
                            fontSize: widget.frontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Menu List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: menuItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No menu items available"));
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Menu Name')),
                          DataColumn(label: Text('Category')),
                          DataColumn(label: Text('Price')),
                        ],
                        rows: snapshot.data!.map((item) {
                          return DataRow(cells: [
                            DataCell(Text(item['id'].toString())),
                            DataCell(Text(item['menuName'])),
                            DataCell(Text(item['category'])),
                            DataCell(Text(item['price'].toString())),
                          ]);
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
