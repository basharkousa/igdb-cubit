
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/configs/dimens.dart';

class DialogDefault extends StatefulWidget {
  DialogDefault({Key? key,required this.listItems,required this.onSelectItem}) : super(key: key);
  final List<String>? listItems;
  final Function(String)? onSelectItem;

  @override
  _DialogDefaultState createState() => new _DialogDefaultState();
}

class _DialogDefaultState extends State<DialogDefault> {
  TextEditingController editingController = TextEditingController();

  var duplicateItems = <String>[];
  var items = <String>[];

  @override
  void initState() {
    duplicateItems = widget.listItems!;
    items.addAll(duplicateItems);
    print('${items.length}');
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(Dimens.mainMargin.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.w)),
        child: Scaffold(
          // appBar: new AppBar(
          //   title: new Text(widget.title??'HIIII'),
          // ),
          body: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        // suffix: Icon(Icons.search),
                        suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: (){
                          Get.back();
                        },)
                        // suffix: Icon(Icons.search,color: Colors.red,),
                        // icon: Icon(Icons.close),
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(14.0)))
                    ),
                  ),
                ),
                Expanded(
                  child: items.isNotEmpty ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){
                          widget.onSelectItem!(items[index]);
                        },
                        title: Text('${items[index]}'),
                      );
                    },
                  ):InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Center(child: Text('No Items'),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}