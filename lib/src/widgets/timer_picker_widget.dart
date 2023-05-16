import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';

class TimerPickerWidget extends StatelessWidget with ColorsUtils {
  TimerPickerWidget({super.key, required this.onConfirm});

  final Function(String) onConfirm;
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimerPicker(),
        const SizedBox(height: 10),
        _buildButtonConfirmar()
      ],
    );
  }

  Widget _buildTimerPicker() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
          color: primaryBlue, borderRadius: AppShapes.radius(RadiusSize.small)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Center(
        child: TimePickerSpinner(
          is24HourMode: true,
          normalTextStyle: TextStyle(
              fontSize: 24,
              color: primaryBlueDarkLight,
              decoration: TextDecoration.none),
          highlightedTextStyle: TextStyle(
              fontSize: 24,
              color: primaryBlueDark,
              decoration: TextDecoration.none),
          spacing: 50,
          itemHeight: 80,
          isForce2Digits: true,
          onTimeChange: (time) {
            _selectedTime = time;
          },
        ),
      ),
    );
  }

  Widget _buildButtonConfirmar() {
    return TextButtonWidget(
      onPressed: (){
        String hourTratado = '${_selectedTime.hour}:${_selectedTime.minute}';
        onConfirm.call(hourTratado);
        singNavigator.popNavigate();
      },
      text: 'Confirmar',
      textColor: Colors.white,
      backgroundColor: buttonColor,
      height: 45,
      width: double.infinity,
    );
  }
}
