import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/domain/bloc/log/log_bloc.dart';
import 'package:sigest/domain/bloc/product/product_bloc.dart';
import 'package:sigest/ui/pages/home/tabs/help/help_tab.dart';
import 'package:sigest/ui/pages/home/tabs/log/log_tab.dart';
import 'package:sigest/ui/pages/home/tabs/profile/profile_tab.dart';
import 'package:sigest/ui/pages/home/tabs/stock/stock_tab.dart';
import 'package:sigest/ui/pages/home/tabs/upload_product/upload_tab.dart';

class NavigatorViewWidget extends StatefulWidget {
  final UserModel userModel;

  const NavigatorViewWidget({super.key, required this.userModel});

  @override
  State<NavigatorViewWidget> createState() => _NavigatorViewWidgetState();
}

class _NavigatorViewWidgetState extends State<NavigatorViewWidget> {
  int _currentIdex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        header: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/icon/icon-s.png'),
                DefaultTextStyle(
                  style: FluentTheme.of(context).typography.title!,
                  child: const Text(
                    'SiGeSt',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 52, 180, 255)),
                  ),
                ),
              ],
            ),
          ),
        ),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.product_variant),
            title: const Text('Stock'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.product_release),
            title: const Text('Alta de producto'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.message_friend_request),
            title: const Text('Ayuda'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.switch_user),
            title: const Text('Log'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.contact),
            title: const Text('Perfil'),
          ),
        ],
        selected: _currentIdex,
        displayMode: PaneDisplayMode.top,
        onChanged: (i) {
          if (i == 0) {
            context.read<ProductBloc>().add(const ProductEvent.getActive());
          }
          if (i == 1) {
            context.read<ProductBloc>().add(const ProductEvent.getPending());
          }
          if (i == 4) {
            context.read<LogBloc>().add(const LogEvent.get());
          }
          setState(() {
            _currentIdex = i;
          });
        },
      ),
      content: NavigationBody(
        index: _currentIdex,
        children: [
          StockTab(userModel: widget.userModel),
          UploadTab(userModel: widget.userModel),
          HelpTab(userModel: widget.userModel),
          LogTab(userModel: widget.userModel),
          ProfilTab(userModel: widget.userModel),
        ],
      ),
    );
  }
}
