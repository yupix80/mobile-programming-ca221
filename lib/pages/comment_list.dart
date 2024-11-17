import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  final Function(String) onSaved;

  const CommentView({Key? key, required this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> comments = [
      {
        'name': 'Gisselle Franecki III',
        'comment': 'Fermentum et sollicitudin ac orci phasellus egestas tellus rutrum.',
        'date': '04 Sep 1751'
      },
      {
        'name': 'Malika Pfannerstill',
        'comment': 'Orci ac auctor augue mauris augue neque gravida in fermentum.',
        'date': '03 Nov 8989'
      },
      {
        'name': 'Izabella Swift',
        'comment': 'Leo integer malesuada nunc vel.',
        'date': '11 Dec 8504'
      },
      {
        'name': 'Mr. Maximillia Johnson DVM',
        'comment': 'Tristique sollicitudin nibh sit amet commodo nulla facilisi.',
        'date': '18 Feb 6057'
      },
      {
        'name': 'Mrs. Noah Krajcik',
        'comment': 'Vitae proin sagittis nisl rhoncus.',
        'date': '04 Aug 5856'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            title: Text(
              comment['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(comment['comment']!),
            trailing: Text(
              comment['date']!,
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
