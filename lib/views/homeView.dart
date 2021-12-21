// ignore_for_file: file_names

import 'dart:js';

import 'package:contact_ui/views/contact.dart';
import 'package:contact_ui/views/contactDetails.dart';
import 'package:contact_ui/views/delete.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
   HomeView({ Key? key }) : super(key: key);

 // @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final contactUi =[
    Contact(
      name: "Anthony Joe",
      number: "+233557338587",
      email: "anthony23@gmail.com",
      id: "0"
    ),
     Contact(
      name: "Matt Emily",
      number: "+233557344587",
      email: "mattemi334@gmail.com",
      id: "1"
    ), Contact(
      name: "Johnson Barnabas",
      number: "+233577399487",
      email: "johnson243@gmail.com",
      id: "2"
    ), Contact(
      name: "Mensah kavi",
      number: "+233507889587",
      email: "kavibodo23@gmail.com",
      id: "3"
    ), Contact(
      name: "Kojo Nkasah kwame",
      number: "+233247399587",
      email: "nkasahkwame13@gmail.com",
      id: "4"
    ),
  ];

 int _selectedIndex = 0;

  var contact;

 void _isSelected(int index){
   setState(() {
      _selectedIndex = index;
   });
  
 }
 List ViewsList = [

 ];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
appBar: AppBar(
  //backgroundColor: Colors.blue,
  title: Text("Contacts", style: Theme.of(context).appBarTheme.titleTextStyle),
  bottom:  PreferredSize(
    child: TextField(
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      hintText: "Search contacts",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
       // borderSide: BorderSide(),
      ),
    ),
  ) ,

  preferredSize: Size.fromHeight(30),   
  ),

  ),
  bottomNavigationBar: BottomNavigationBar(items: const  [
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
    BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Recents"),
    BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contacts"),
    BottomNavigationBarItem(icon: Icon(Icons.voicemail), label: "Voicemail"),
  ],
 
  selectedIconTheme: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,

  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
  currentIndex: _selectedIndex,
  onTap: _isSelected,
  ),

body: ListView.builder(itemBuilder: (context, index){
  return Dismissible(//key: ValueKey(contact[index].id),
  key: UniqueKey(),
  background: Container( color: Colors.red,
  child: Icon(Icons.delete),),
  direction: DismissDirection.startToEnd,
  confirmDismiss: (direction) async {
    var result = await showDialog(context: context, builder: (context)=>const Delete());
    return result;
  },
  onDismissed: (direction){
    setState(() {
      contact.remove(index);
    });
  },
    child: ListTile(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ContactDetails(),
        ));
      },
      title: Text("Peosper A", style: Theme.of(context).textTheme.bodyText1),
      subtitle: Text("+233207885790", style: Theme.of(context).textTheme.bodyText2),
      trailing: IconButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context)=>Column(
          children: [
            TextButton(onPressed: (){
  
            }, child: Text("Edit"))
          ],
        ),);
      }, icon: Icon(Icons.more_horiz)),
    ),
  );
  
},
itemCount: 9,
),


    );
  }


}


