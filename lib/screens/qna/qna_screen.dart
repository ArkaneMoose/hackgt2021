import 'package:flutter/material.dart';
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/models/coins.dart';
import 'package:retail_io/models/task.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class QnAScreen extends StatefulWidget {
  final QnATask task;

  const QnAScreen({required this.task, Key? key}) : super(key: key);

  @override
  _QnAScreenState createState() => _QnAScreenState();
}

class _QnAScreenState extends State<QnAScreen> {
  int? selected;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Question Challenge"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: submitted
                      ? "Congratulations, you earned "
                      : "Answer this question correctly to earn ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const WidgetSpan(child: CoinIcon(size: 20)),
                TextSpan(
                    text: " ${widget.task.reward}!",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
              style: const TextStyle(fontSize: 16),
            )),
            const SizedBox(height: 20),
            Image.asset(widget.task.imagePath),
            const SizedBox(height: 20),
            Text(widget.task.question, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Column(
                children: widget.task.answers.mapIndexed((i, answer) {
              return RadioListTile(
                title: Text(answer, style: const TextStyle(fontSize: 18)),
                value: submitted ? true : i,
                groupValue: submitted
                    ? widget.task.correctAnswers.contains(i)
                    : selected,
                onChanged: submitted
                    ? null
                    : (value) {
                        setState(() {
                          selected = i;
                        });
                      },
              );
            }).toList()),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: selected != null
                    ? () => {
                          if (submitted)
                            {Navigator.pop(context)}
                          else
                            {
                              setState(() {
                                submitted = true;
                                if (widget.task.correctAnswers
                                    .contains(selected)) {
                                  Provider.of<CoinsModel>(context,
                                          listen: false)
                                      .addCoins(widget.task.reward);
                                }
                              })
                            }
                        }
                    : null,
                child: Text(submitted ? "Continue" : "Submit")),
          ],
        ),
      ),
    );
  }
}
