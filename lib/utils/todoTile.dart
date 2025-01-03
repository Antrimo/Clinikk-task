import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onDelete;

  const TodoTile({
    super.key,
    required this.title,
    required this.isChecked,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Checkbox(value: isChecked, onChanged: onChanged),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: TextStyle(
                    decoration:
                    isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                    fontSize: 16,
                    color: isChecked ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
