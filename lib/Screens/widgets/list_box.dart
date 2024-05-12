
import 'package:flutter/material.dart';
import 'package:is_time_management/Screens/utils/all_list.dart';

import '../../helpers/constants/constants.dart';

class Listbox extends StatelessWidget {
  final Function(BuildContext,int) showdialog;
  final Function(int,int) removeList;
  final int boxnumber;
  final List<String> list;
  final String bartext;
  final Color barcolor;
  final Color countcolor;
  final Color buttonbacground;


  Listbox({required this.bartext, required this.barcolor,required this.countcolor,required this.buttonbacground,
  required this.showdialog, required this.list, required this.boxnumber, required this.removeList
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(

      child: Column(
        children: [
          //listtopbar
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5
            ),
            color: barcolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(bartext,
                  style:kTextstyle ,),

                Text(list.length.toString(),style: kTextstyle.copyWith(
                  color:countcolor,
                ), ),

                TextButton(

                  onPressed: (){
                    showdialog(context,boxnumber);
                  },
                  child: Text("+ ADD",
                    style: kTextstyle.copyWith(
                        color: Color(0xff1C1B1F),
                        fontSize: 18
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: buttonbacground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),


                  ),
                )
              ],
            ),

          ),






          //listview
          Container(
            height: 180, // Adjust height as needed
            child: ListView.builder(
              itemCount: list.length, // Replace with your data count
              itemBuilder: (context, index){
                return  Material(
                  elevation: 1,

                  child: TextButton(
                      onLongPress: (){
                        removeList(boxnumber,index);
                      },
                    onPressed: () {  },
                    child: Text(list[index]),
                    style: TextButton.styleFrom(
                        shadowColor:Colors.red ,
                      alignment: Alignment.centerLeft,
                      // overlayColor: MaterialStateProperty.all(Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Change to your desired shape
                      ),
                    ),

                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}