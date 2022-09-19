import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';
import 'package:sigest/web/home/tabs/profile/profile_tab.dart';
import 'package:sigest/web/home/tabs/stock/stock_tab.dart';
import 'package:sigest/web/home/tabs/upload_product/upload_tab.dart';

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
      /* appBar: const NavigationAppBar(
                leading: Center(
                  child: FlutterLogo(size: 25),
                ),
              ), */
      pane: NavigationPane(
        header: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: DefaultTextStyle(
            style: FluentTheme.of(context).typography.title!,
            child: const Text('SiGeSt'),
          ),
        ),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.stock_down),
            title: const Text('Stock'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.stock_up),
            title: const Text('Alta Producto'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.profile_search),
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
          ProfilTab(userModel: widget.userModel),
        ],
      ),
    );
  }
}
