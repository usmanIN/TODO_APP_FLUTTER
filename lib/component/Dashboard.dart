import 'package:flutter/material.dart';
import 'package:todo_app/component/DetailPage.dart';
import 'package:todo_app/method/Item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});
  final String title;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //List<String> itemList = ["Wake up early","Make a coffee","9-5 Work","Shopping","Bedtime"];

  List<Item> itemList = [];

  @override
  void initState(){
    super.initState();
    itemList = sampleItems;

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),

        ),
      ),
      backgroundColor: Colors.grey.shade900,
      body:Padding(
        padding: const EdgeInsets.all(8.0),

        child: ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context,index){
              var item = itemList[index];
              return Card(
                margin: EdgeInsets.only(bottom: 10),
                color: Theme.of(context).primaryColorLight,
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    leading: Checkbox(
                      value: item.isComplete,
                      onChanged: (value) {
                        setState(() {
                          item.isComplete = (!item.isComplete);
                        });
                      },
                    ),
                    title: Text(item.title,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: (item.isComplete)?TextDecoration.lineThrough:null,
                      decorationThickness: 3,
                    ),),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (){
                        setState(() {
                          itemList = itemList.where((element) => element.id != item.id).toList();
                        });
                      },
                    ),
                    onTap: () async{
                      final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(item: item),));
                      setState(() {
                        int idx = sampleItems.indexOf(item);
                        result.id = idx;
                        sampleItems[idx] = result;
                        itemList = sampleItems;
                      });
                    },
                  ),
                )
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(Icons.add, size: 38, color: Colors.white,),
        onPressed: () async{
          final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => const DetailPage()));
          if(result != null && result.title!=''){
            setState(() {
              sampleItems.add(result);
              itemList = sampleItems;
            });
          }
        },
      ),
    );
  }
}
