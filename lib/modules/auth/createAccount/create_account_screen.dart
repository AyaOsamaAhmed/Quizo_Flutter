import 'package:flutter/material.dart';

import '../../../generated/strings.dart';

class CreateAccountScreen extends StatefulWidget {

  static const routeName = "CreateAccount";
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  static const List<Tab> typeAccount = <Tab>[
    Tab(text: Strings.phone_number),
    Tab(text: Strings.email),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(Strings.help , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold ,color: Colors.red),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20 , right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.create_account,style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold , color: Color(0xFF212121)),),
            SizedBox(child: Text(Strings.sub_create_account,style: TextStyle(fontSize: 15, color: Color(0xFF9E9E9E)) ,  )),
        DefaultTabController(
          length: 2,
          child:TabBar(tabs: typeAccount)
          /*Column(
            children: [

              /*TabBarView(
                children: typeAccount.map((Tab tab){
                final String label = tab.text!.toLowerCase();
                return Center(
                child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
                ),
                );
                }).toList(),*/

            ],
          ),
*/
        )
          ],
        ),
      ),
    );
  }
}
