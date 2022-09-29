import 'package:fluent_ui/fluent_ui.dart';
import 'package:readmore/readmore.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/data/models/user_model/user_model.dart';

class LogRow extends StatelessWidget {
  final LogModel logModel;
  final UserModel userModel;
  final int index;

  const LogRow(
      {super.key,
      required this.logModel,
      required this.index,
      required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.grey.withOpacity(0.2) : Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              logModel.action,
              textAlign: TextAlign.center,
              style: styleTextProductRow,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ReadMoreText(
              logModel.desc,
              textAlign: TextAlign.center,
              style: styleTextProductRow,
              trimLines: 1,
              trimMode: TrimMode.Line,
              trimCollapsedText: '(+)',
              trimExpandedText: '(-)',
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              logModel.date.toString(),
              textAlign: TextAlign.center,
              style: styleTextProductRow,
            ),
          ),
        ],
      ),
    );
  }
}
