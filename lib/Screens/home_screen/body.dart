import 'package:flutter/material.dart';
import 'package:is_time_management/Screens/utils/all_list.dart';
import 'package:is_time_management/helpers/constants/constants.dart';

import '../widgets/list_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  AllList allList=AllList();
   late TextEditingController textEditingController;


  void updateList(int boxnumber, String value){

      if(boxnumber==1){
        setState(() {
          allList.list1.add(value);
        });

      }else if(boxnumber==2){
        setState(() {
          allList.list2.add(value);
        });
      }
      else if(boxnumber==3){
        setState(() {
          allList.list3.add(value);
        });
      }else{
        setState(() {
          allList.list4.add(value);
        });
      }
  }

  void removeList(int boxnumber,int index){
    if(boxnumber==1){
      setState(() {
        allList.list1.removeAt(index);
      });

    }else if(boxnumber==2){
      setState(() {
        allList.list2.removeAt(index);
      });
    }
    else if(boxnumber==3){
      setState(() {
        allList.list3.removeAt(index);
      });
    }else{
      setState(() {
        allList.list4.removeAt(index);
      });
    }
  }

 void ShowDialogFunction(BuildContext context, int boxnumber){

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Item"),
            content: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Enter anything",

              ),

            ),
          actions: [

            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("cancel")
            ),

            TextButton(
                onPressed: (){
                  if(textEditingController.text.isNotEmpty){
                    updateList(boxnumber,
                        textEditingController.text
                    );
                    Navigator.of(context).pop();
                    textEditingController.clear();
                  }

                },
                child: Text("Add")
            ),



          ],
          );
        },
    );
 }



 @override
  void initState() {

    super.initState();
    textEditingController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: CustomScrollView(
        slivers: [
          //top motivation bar
          SliverToBoxAdapter(

            child:Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                      child: Text("পরকালে মানুষ যে বিষয়ে সবছেয়ে বেশি অনুতপ্ত হবে"
                          " তা হলো অবসর সময়ের সদ্ব্যবহার না করা",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                  Expanded(
                    flex: 2,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_forward),
                      ))
                ],
              ),
            ),
          ),

          Listbox(
            removeList: removeList,
            boxnumber: 1,
            list: allList.list1,
            showdialog: ShowDialogFunction,
            bartext: "Important and Urgent",
            barcolor: Color(0xffFFCCBC),
            countcolor: Color(0xffFF5722),
            buttonbacground: Color(0xffFBE9E7),
          ),

          Listbox(
            removeList: removeList,
            boxnumber: 2,
            list: allList.list2,
            showdialog: ShowDialogFunction,
            bartext: "Important and Urgent",
            barcolor: Color(0xffC8E6C9),
            countcolor: Color(0xff4CAF50),
            buttonbacground: Color(0xffE8F5E9),
          ),

          Listbox(
            removeList: removeList,
            list: allList.list3,
            boxnumber: 3,
            showdialog: ShowDialogFunction,
            bartext: "Important and Urgent",
            barcolor: Color(0xffCFD8DC),
            countcolor: Color(0xff9E9E9E),
            buttonbacground: Color(0xffECEFF1),
          ),
          //
          Listbox(
            removeList: removeList,
            list: allList.list4,
            boxnumber: 4,
            showdialog: ShowDialogFunction,
            bartext: "Important and Urgent",
            barcolor: Color(0xffFFF9C4),
            countcolor: Color(0xffefdb21),
            buttonbacground: Color(0xfff3dbb3),
          ),
        ],
      ),
    );
  }
}

