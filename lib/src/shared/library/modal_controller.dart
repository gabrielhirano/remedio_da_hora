import 'package:flutter/material.dart';

class ModalController {
  late BuildContext context;
  int idController =0;
  ModalController();

  // late CustomContent customContent;

  void openDialog({
    required Widget content,
  }) {
    // creatorCustomContentObject(
    //   title: title,
    //   subTitle: subTitle,
    //   width: width,
    //   content: content,
    //   marginBottom: marginBottom ?? 15,
    // );
    try {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 400),
        context: context,
        pageBuilder: (BuildContext buildContext, __, ___) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 50),
            alignment: Alignment.center,
            child: content,
          );
          return SizedBox.expand(
            child: content,
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: const Offset(0, 1), end: const Offset(0, 0.0))
                    .animate(anim),
            child: child,
          );
        },
      );
    } catch (e) {
      print('=================================');
      print('modal-global');
      print('showAlert => invalid context');
    }
  }

//   creatorCustomContentObject({
//     required String title,
//     required String? subTitle,
//     required double? width,
//     required Widget content,
//     double? marginBottom,
//   }) {
//     CustomContent obj = CustomContent(
//       title: title,
//       subTitle: subTitle,
//       width: width,
//       content: content,
//       marginBottom: marginBottom ?? 15,
//     );

//     customContent = obj;
//   }

//   setContext(BuildContext _context) {
//     context = _context;
//   }

//   getContext() {
//     return customContent.onwContext;
//   }
// }

// class CustomContent extends StatelessWidget {
//   CustomContent({
//     Key? key,
//     required this.title,
//     this.subTitle,
//     this.width,
//     required this.marginBottom,
//     required this.content,
//   }) : super(key: key);

//   final String title;
//   final String? subTitle;
//   final double? width;
//   final Widget content;
//   final double marginBottom;

//   late BuildContext _context;

//   BuildContext get onwContext => _context;

//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     return Dialog(
//       alignment: Alignment.topCenter,
//       child: Container(
//         color: Colors.white,
//         width: width ?? MediaQuery.of(context).size.width * 0.8,
//         constraints: BoxConstraints(
//             maxWidth: 1300,
//             maxHeight: MediaQuery.of(context).size.height * 0.75),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               _buildHeader(context),
//               content,
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _buildHeader(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
//       color: ColorsUtil.primaryBlue,
//       child: Wrap(
//         alignment: WrapAlignment.spaceBetween,
//         crossAxisAlignment: WrapCrossAlignment.center,
//         children: [
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     color: ColorsUtil.white,
//                     fontSize: 18,
//                   ),
//                 ),
//                 (subTitle != null)
//                     ? TextSpan(
//                         text: '\n$subTitle',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color: ColorsUtil.white,
//                           fontSize: 16,
//                         ),
//                       )
//                     : const TextSpan()
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.close,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
