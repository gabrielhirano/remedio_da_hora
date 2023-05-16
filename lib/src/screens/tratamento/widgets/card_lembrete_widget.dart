import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class CardLembreteWidget extends StatelessWidget with ColorsUtils{
  const CardLembreteWidget({super.key, required this.medicine, required this.onPressed});
  final Medicine medicine;
  final Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    return _card(medicine);
  }

  Widget _card(Medicine medicine) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 15, right: 30),
        decoration: BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.svgs.icPill.svg(
                    width: 22,
                    height: 22,
                    color: primaryBlueDark,
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: Container(
                        child: Text(
                          medicine.name!,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryBlueDark),
                        )),
                  ),
                ],
              ),
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
                  width: 100,
                  decoration: BoxDecoration(
                    color: primaryBlueDarkLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${medicine.dose} ${medicine.unity}',
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
      ),
    );
  }
}
