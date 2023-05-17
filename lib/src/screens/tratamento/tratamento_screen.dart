import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/tratamento/screens/cadastro_frequencia_screen.dart';
import 'package:remedio_da_hora/src/screens/tratamento/screens/cadastro_hora_lembrete_screen.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_controller.dart';
import 'package:remedio_da_hora/src/screens/tratamento/widgets/card_lembrete_alterar_dados_widget.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/bottomsheets/bottom_sheet_list_option_widget.dart';
import 'package:remedio_da_hora/src/widgets/bottomsheets/bottom_sheet_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/icon_button_widget.dart';

import 'widgets/card_lembrete_widget.dart';
import 'widgets/modal_cadastro_widget.dart';

class TratamentoScreen extends StatefulWidget {
  const TratamentoScreen({super.key});

  @override
  State<TratamentoScreen> createState() => _TratamentoScreenState();
}

class _TratamentoScreenState extends State<TratamentoScreen> with ColorsUtils {
  late TratamentoController controller;
  Medicine medicine = Medicine();

  @override
  void initState() {
    super.initState();

    _buscandoDados();
  }

  _buscandoDados() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.buscarMedicamentos();
    });
  }

  _reloadPage() {
    controller.buscarMedicamentos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<TratamentoController>(context);
    singModal.context = context;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildDahorinhaInforma(),
            _buildItens(),
          ],
        ),
      ),
      floatingActionButton: _buildBotaoAdicionar(),
    );
  }

  Widget _buildDahorinhaInforma() {
    return Container(
      height: 100,
      color: Colors.blue,
      child: const Center(child: Text('Dahorinha aqui')),
    );
  }

  Widget _buildItens() {
    // controller.buscarMedicamentos();
    DebugUtils.log('Build itens', error: '${controller.medicamentos}');
    if (controller.medicamentos.isEmpty) {
      return const CircularProgressIndicator();
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height - 176,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: controller.medicamentos.length,
        itemBuilder: ((context, index) {
          singModal.idController = controller.medicamentos.last.id!.toInt();
          
          return CardLembreteWidget(
            medicine: controller.medicamentos[index],
            onPressed: () {

              singModal.openDialog(
                content: CardLembreteAlterarDadosWidget(medicine: controller.medicamentos[index], controller: controller,)
              );

            },
          );
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
            onPressed: _adicionarNewMedicine,
          )
        ],
      ),
    );
  }

  _adicionarNewMedicine() {
    singModal.openDialog(
      content: ModalCadastroWidget(
        medicine: medicine,
        onNext: () {
          _navigateToCadastroFrequencia();
        },
      ),
    );
  }

  _navigateToCadastroFrequencia() {
    singNavigator.navigate(
      CadastroFrequenciaTratamentoScreen(
        medicine: medicine,
        onNext: () {
          _navigateToCadastroHora();
        },
      ),
    );
  }

  _navigateToCadastroHora() {
    singNavigator.navigate(
      CadastroHoraLembreteTratamentoScreen(
        medicine: medicine,
        onNext: () {
          _closeStackRoutes();
          medicine.id = singModal.idController = singModal.idController+1;
          DebugUtils.log('==== cadastro ${medicine.id}');
          controller.cadastrarMedicamento(medicine);
          // finalizar o cadastro do item.
        },
      ),
    );
  }

  _closeStackRoutes() {
    singNavigator.popNavigate();
    singNavigator.popNavigate();
    singNavigator.popNavigate();
    singNavigator.popNavigate();
  }
}
