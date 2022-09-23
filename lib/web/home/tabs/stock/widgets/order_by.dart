import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigest/constants/constant.dart';
import 'package:sigest/web/domain/bloc/product/product_bloc.dart';

class OrderBy extends StatelessWidget {
  const OrderBy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      child: Combobox<String>(
        placeholder: const Text(
          'Ordenar por:',
          style: TextStyle(color: Colors.black),
        ),
        isExpanded: true,
        items: valuesComboBox
            .map((e) => ComboboxItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          context.read<ProductBloc>().add(ProductEvent.getActive(sort: value));
        },
      ),
    );
  }
}
