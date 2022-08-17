import 'package:flutter/material.dart';
import 'package:to_dos_functional/models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  // ScrollController? scrollController;
  @override
  void initState() {
    super.initState();
    // scrollController = ScrollController()
    //   ..addListener(() {
    //     FocusScope.of(context).requestFocus(FocusNode());
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Master Plan'),
        ),
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  @override
  void dispose() {
    // scrollController!.dispose();
    super.dispose();
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          if (plan.tasks.isEmpty || plan.tasks.last.description != '')
            plan.tasks.add(
              (Task()),
            );
        });
      },
    );
  }

  Widget _buildList() {
    if (plan.tasks.isNotEmpty)
      return ListView.builder(
        // controller: scrollController,
        itemCount: plan.tasks.length,
        itemBuilder: (context, index) =>
            _buildTaskTile(plan.tasks, plan.tasks[index], index),
      );
    else {
      return const Center(
        child: Text('Tap button to add tasks in list.'),
      );
    }
  }

  Widget _buildTaskTile(List tasks, Task task, int index) {
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) {
        setState(() {
          tasks.removeAt(index);
        });
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              task.complete = selected!;
            });
          },
        ),
        title: TextField(onChanged: (text) {
          setState(() {
            task.description = text;
          });
        }),
      ),
    );
  }
}
