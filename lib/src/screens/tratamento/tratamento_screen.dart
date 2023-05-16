import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/tratamento/screens/cadastro_frequencia_screen.dart';
import 'package:remedio_da_hora/src/screens/tratamento/screens/cadastro_hora_lembrete_screen.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_controller.dart';
import 'package:remedio_da_hora/src/shared/extensions/string_extension.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/bottomsheets/bottom_sheet_list_option_widget.dart';
import 'package:remedio_da_hora/src/widgets/bottomsheets/bottom_sheet_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/icon_button_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';
import 'package:remedio_da_hora/src/widgets/dropdwns/drop_down_widget.dart';

import 'widgets/card_lembrete_widget.dart';
import 'widgets/modal_cadastro_widget.dart';

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
    if (controller.medicamentos.isEmpty)
      return const CircularProgressIndicator();

    return SizedBox(
      height: MediaQuery.of(context).size.height - 132,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: controller.medicamentos.length,
        itemBuilder: ((context, index) {
          return CardLembreteWidget(medicine: controller.medicamentos[index]);
        }),
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
              singModal.openDialog(
                  content: ModalCadastroWidget(
                textController: textController,
                onNext: () {
                  singNavigator.navigate(
                    CadastroFrequenciaTratamentoScreen(
                      onNext: () {
                        singNavigator.navigate(
                          CadastroHoraLembreteTratamentoScreen(
                            onNext: () {
                              singNavigator.popNavigate();
                              singNavigator.popNavigate();
                              singNavigator.popNavigate();
                              singNavigator.popNavigate();
                              
                              // finalizar o cadastro do item.
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ));
            },
          )
        ],
      ),
    );
  }
}
