import 'package:flutter/material.dart';
import 'package:todo_app/method/Item.dart';

class DetailPage extends StatefulWidget {

  final Item? item;
  const DetailPage({super.key, this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState(){
    super.initState();
    if(widget.item !=null){
      _titleController = TextEditingController(text: widget.item!.title);
      _contentController = TextEditingController(text: widget.item!.content);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle( color:  Colors.grey, fontSize: 30),
                      ),
                    ),
                    TextField(
                      controller: _contentController,
                      style: const TextStyle(color: Colors.white),
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something here',
                        hintStyle: TextStyle( color:  Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final result = Item(
            id: sampleItems.length,
            title: _titleController.text,
            content: _contentController.text,
          );
            Navigator.pop(context,result);
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(Icons.save,color: Colors.white,),
      ),
    );
  }
}
