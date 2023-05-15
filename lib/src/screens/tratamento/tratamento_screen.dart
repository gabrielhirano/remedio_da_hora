import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_controller.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/bottomsheets/bottom_sheet_list_option_widget.dart';
import 'package:remedio_da_hora/src/widgets/bottomsheets/bottom_sheet_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/icon_button_widget.dart';

class TratamentoScreen extends StatefulWidget {
  const TratamentoScreen({super.key});

  @override
  State<TratamentoScreen> createState() => _TratamentoScreenState();
}

class _TratamentoScreenState extends State<TratamentoScreen> with ColorsUtils {
  late TratamentoController controller;
  final TextEditingController textController = TextEditingController();
  String optionUnidade = 'Opção 1';

  int contador = 0;

  @override
  void initState() {
    // _buscandoDados();
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller =
          Provider.of<TratamentoController>(context, listen: false);
      controller.buscarMedicamentos();
    });
  }

  _buscandoDados() {
    // DebugUtils.genericLog('message', Level.warning);
  }
  _reloadPage() {
    // DebugUtils.genericLog('reload', Level.warning);
    _buscandoDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<TratamentoController>(context);
    singModal.context = context;

    // controller.buscarMedicamentos();
    return Scaffold(
      appBar: AppBar(),
      // body: ListView.builder(
      //   padding: EdgeInsets.symmetric(vertical: 12),
      //   itemCount: _controller.medicamentos.length,
      //   itemBuilder: ((context, index) {
      //     return
      //   }),
      // ));
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildItens(),
          ],
        ),
      ),
      floatingActionButton: _buildBotaoAdicionar(),
    );
  }

  Widget _buildItens() {
    // controller.buscarMedicamentos();
    DebugUtils.log('Build itens', error: '${controller.medicamentos}');
    if (controller.medicamentos.isEmpty) return CircularProgressIndicator();

    return Container(
      height: MediaQuery.of(context).size.height - 132,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: controller.medicamentos.length,
        itemBuilder: ((context, index) {
          return _card(controller.medicamentos[index]);
        }),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //   child: _card(Medicine(
    //       id: 1,
    //       dose: 2,
    //       frequency: 'Diario',
    //       name: 'Paracetamol 500 mg Pó para Solução Oral',
    //       active: true,
    //       time: '08:00')),
    // );
  }

  Widget _card(Medicine medicine) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 15, right: 30, bottom: 10),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Assets.svgs.icPill.svg(
                width: 22,
                height: 22,
                color: primaryBlueDark,
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      medicine.name,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryBlueDark),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            '${medicine.frequency} - ${medicine.time}',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryBlueDarkLight),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 90,
                decoration: BoxDecoration(
                  color: primaryBlueDarkLight,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${medicine.dose} unidade(s)',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue),
                ),
              ),
              Assets.svgs.icBell.svg(
                width: 22,
                height: 22,
                color: primaryBlueDark,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBotaoAdicionar() {
    return IconButtonWidget(
      text: 'Adicionar',
      color: primaryBlueDark,
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      width: 120,
      height: 50,
      borderRadius: BorderRadiusOwn.circular,
      onPressed: () {
        singNavigator.showBottomSheet(
          BottomSheetWidget(
            backgroundColor: primaryBlueLight,
            child: _buildOptionsBottomSheet(),
          ),
        );
      },
    );
  }

  Widget _buildOptionsBottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        children: [
          BottomSheetListOptionWidget(
            icon: Assets.svgs.icPill.svg(width: 20, height: 20),
            text: 'Medicamento',
            onPressed: () {
              singModal.openDialog(content: _modalCadastroNomeMedicamento());
            },
          )
        ],
      ),
    );
  }

  Widget _modalCadastroNomeMedicamento() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: primaryBlue, borderRadius: AppShapes.radius(RadiusSize.small)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          // Container(
          //   child: Row(children: [
          //     Assets.svgs.icPill.svg(
          //         width: 24, height: 24, color: primaryBlueDark),
          //     const SizedBox(
          //       width: 50,
          //     ),
          //     Text(
          //       'Medicamentos',
          //       style: TextStyle(
          //           color: primaryBlueDark,
          //           fontSize: 16,
          //           decoration: TextDecoration.none),
          //     )
          //   ]),
          // ),
          Text(
            'Medicamentos',
            style: TextStyle(
                color: primaryBlueDark,
                fontSize: 16,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 15),
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
                        horizontal: 9), // Define o espaçamento à esquerda
                    child: Assets.svgs.icPill.svg(
                      width: 22,
                      height: 22,
                      color: primaryBlueDark,
                    ),
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 40, maxWidth: 40),
                  border: OutlineInputBorder(
                    borderRadius: AppShapes.radius(RadiusSize.small),
                    // borderSide: BorderSide(
                    //   color: ColorsUtils
                    //       .primaryBlueDark, // Define a cor da borda
                    //   width: 2, // Define a largura da borda
                    // ),
                  ),
                ),
                controller: textController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: AppShapes.radius(RadiusSize.small),
                color: secondaryBlueDark),
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
                Material(
                  child: DropdownButton(
                    autofocus: true,
                    focusColor: secondaryBlueDark,
                    value: optionUnidade, // Valor selecionado
                    items: const [
                      DropdownMenuItem(
                        value: 'Opção 1',
                        child: Text('Opção 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Opção 2',
                        child: Text('Opção 2'),
                      ),
                      DropdownMenuItem(
                        value: 'Opção 3',
                        child: Text('Opção 3'),
                      ),
                    ],
                    
                    onChanged: (value) {
                      setState(() {
                        
                        optionUnidade = value!;
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
