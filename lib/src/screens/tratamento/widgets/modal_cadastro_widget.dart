import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/shared/extensions/string_extension.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';
import 'package:remedio_da_hora/src/widgets/dropdwns/drop_down_widget.dart';

class ModalCadastroWidget extends StatefulWidget {
  const ModalCadastroWidget({super.key, required this.textController, required this.onPressed});
  final TextEditingController textController;
  final Function() onPressed;

  @override
  State<ModalCadastroWidget> createState() => _ModalCadastroWidgetState();
}

class _ModalCadastroWidgetState extends State<ModalCadastroWidget>
    with ColorsUtils {
  @override
  Widget build(BuildContext context) {
    return _modalCadastroNomeMedicamento();
  }

  Widget _modalCadastroNomeMedicamento() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
          color: primaryBlue, borderRadius: AppShapes.radius(RadiusSize.small)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Text(
            'Medicamentos',
            style: TextStyle(
                color: primaryBlueDark,
                fontSize: 16,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 5),
          _buildNomeMedicamentoReativo(),
          const SizedBox(height: 10),
          Container(
            height: 50,
            child: Material(
              borderRadius: AppShapes.radius(RadiusSize.small),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryBlueDark)),
                  labelText: 'Nome do medicamento',
                  labelStyle: TextStyle(color: primaryBlueDark),
                  hintText: 'Ex: Paracetamol...',
                  hintStyle: TextStyle(color: primaryBlueDark),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15), // Define o espaçamento à esquerda
                    child: Assets.svgs.icPill.svg(
                      color: primaryBlueDark,
                    ),
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 46, maxWidth: 46),
                  border: OutlineInputBorder(
                    borderRadius: AppShapes.radius(RadiusSize.small),
                  ),
                ),
                controller: widget.textController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          _cardUnidadeController(),
          const SizedBox(height: 15),
          _buildButtonProsseguir()
        ],
      ),
    );
  }

  Widget _buildNomeMedicamentoReativo() {
    if(widget.textController.text.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 20,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        widget.textController.text.toString(),
        style: TextStyle(
            color: primaryBlueDark,
            fontSize: 12,
            decoration: TextDecoration.none,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget _cardUnidadeController() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: secondaryBlueDark, width: 1),
          borderRadius: AppShapes.radius(RadiusSize.small),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Unidade',
            style: TextStyle(
                fontSize: 14,
                color: primaryBlueDark,
                decoration: TextDecoration.none),
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            child: DropdownButtonWidget(
              optionSelected: 'teste 1',
              itens: [
                DropdownMenuItem(
                  value: 'teste 1',
                  child: Text('teste 1'.captalize()),
                ),
                DropdownMenuItem(
                  value: 'teste 2',
                  child: Text('teste 2'.captalize()),
                ),
                DropdownMenuItem(
                  value: 'teste 3',
                  child: Text('teste 3'.captalize()),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonProsseguir() {
    return TextButtonWidget(
      onPressed: widget.onPressed.call,
      text: 'Prosseguir',
      textColor: Colors.white,
      backgroundColor: buttonColor,
      height: 45,
      width: double.infinity,
    );
  }
}
