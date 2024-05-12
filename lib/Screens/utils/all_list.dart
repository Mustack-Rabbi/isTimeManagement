

class AllList{

  List<String> list1=[];
  List<String> list2=[];
  List<String> list3=[];
  List <String> list4=[];


  void Addlist({ List<String>? list1,List<String>? list2,List<String>? list3,List<String>? list4 }){
    this.list1=list1??this.list1;
    this.list2=list2??this.list2;
    this.list3=list3??this.list3;
    this.list4=list4??this.list4;
  }

}