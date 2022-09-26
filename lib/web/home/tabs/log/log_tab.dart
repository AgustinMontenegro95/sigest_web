import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/web/home/tabs/log/widgets/const_log_row.dart';
import 'package:sigest/web/home/tabs/log/widgets/log_row.dart';

class LogTab extends StatelessWidget {
  final UserModel userModel;

  const LogTab({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogBloc, LogState>(
      builder: (context, state) {
        return Container(
          child: state.maybeWhen(
            loaded: (logList) {
              return ScaffoldPage(
                header: Column(
                  children: const [
                    PageHeader(
                      title: Text('Log'),
                    ),
                    ConstLogRow(),
                  ],
                ),
                content: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: logList!.length,
                    itemBuilder: (context, index) {
                      return LogRow(
                        userModel: userModel,
                        logModel: logList[index]!,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        style: DividerThemeData(
                            decoration: BoxDecoration(color: Colors.white)),
                      );
                    },
                  ),
                ),
              );
            },
            loading: () => const Center(child: ProgressBar()),
            orElse: () => const ProgressBar(),
          ),
        );
      },
    );
  }
}
