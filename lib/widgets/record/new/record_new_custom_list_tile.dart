import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  // leading: Icon
  // title: String
  // trailing: String
  // onTap: void Function()
  const CustomListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  final Icon leading;
  final String title;
  final String trailing;
  final void Function() onTap;

  @override
  State<CustomListTile> createState() {
    return _CustomListTileState();
  }
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: widget.leading,
      title: Text(
        widget.title,
        style: TextStyle(
          color: Theme.of(context).inputDecorationTheme.labelStyle!.color,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.trailing,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color:
                      Theme.of(context).inputDecorationTheme.labelStyle!.color,
                ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: widget.onTap,
    );
  }
}


                  // ListTile(
                  //   contentPadding: EdgeInsets.zero,
                  //   leading: recordTypeIcon,
                  //   title: Text(
                  //     "Type",
                  //     style: TextStyle(
                  //       color: Theme.of(context)
                  //           .inputDecorationTheme
                  //           .labelStyle!
                  //           .color,
                  //     ),
                  //   ),
                  //   trailing: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: <Widget>[
                  //       Text(
                  //         typesLang(
                  //           context,
                  //           _selectedType,
                  //         ),
                  //         style:
                  //             Theme.of(context).textTheme.titleMedium!.copyWith(
                  //                   color: Theme.of(context)
                  //                       .inputDecorationTheme
                  //                       .labelStyle!
                  //                       .color,
                  //                 ),
                  //       ),
                  //       const SizedBox(width: 8),
                  //       const Icon(Icons.arrow_forward_ios),
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //       isScrollControlled: true,
                  //       useSafeArea: true,
                  //       context: context,
                  //       builder: (ctx) => SizedBox(
                  //         height: MediaQuery.of(context).size.height * 0.5,
                  //         width: double.infinity,
                  //         child: SingleChildScrollView(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(20.0),
                  //             child: Column(
                  //               children: [
                  //                 const SizedBox(height: 20),
                  //                 ListTile(
                  //                   leading: const Icon(
                  //                     Icons.money_off_rounded,
                  //                   ),
                  //                   title: const Text(
                  //                     'Expense',
                  //                   ),
                  //                   onTap: () {
                  //                     setState(() {
                  //                       recordTypeIcon =
                  //                           const Icon(Icons.money_off_rounded);
                  //                       _selectedType = 'Expense';
                  //                     });
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //                 ListTile(
                  //                   leading: const Icon(
                  //                     Icons.attach_money_rounded,
                  //                   ),
                  //                   title: const Text(
                  //                     "Income",
                  //                   ),
                  //                   onTap: () {
                  //                     setState(() {
                  //                       recordTypeIcon = const Icon(
                  //                           Icons.attach_money_rounded);
                  //                       _selectedType = 'Income';
                  //                     });
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),                  ListTile(
                  //   contentPadding: EdgeInsets.zero,
                  //   leading: recordTypeIcon,
                  //   title: Text(
                  //     "Type",
                  //     style: TextStyle(
                  //       color: Theme.of(context)
                  //           .inputDecorationTheme
                  //           .labelStyle!
                  //           .color,
                  //     ),
                  //   ),
                  //   trailing: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: <Widget>[
                  //       Text(
                  //         typesLang(
                  //           context,
                  //           _selectedType,
                  //         ),
                  //         style:
                  //             Theme.of(context).textTheme.titleMedium!.copyWith(
                  //                   color: Theme.of(context)
                  //                       .inputDecorationTheme
                  //                       .labelStyle!
                  //                       .color,
                  //                 ),
                  //       ),
                  //       const SizedBox(width: 8),
                  //       const Icon(Icons.arrow_forward_ios),
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //       isScrollControlled: true,
                  //       useSafeArea: true,
                  //       context: context,
                  //       builder: (ctx) => SizedBox(
                  //         height: MediaQuery.of(context).size.height * 0.5,
                  //         width: double.infinity,
                  //         child: SingleChildScrollView(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(20.0),
                  //             child: Column(
                  //               children: [
                  //                 const SizedBox(height: 20),
                  //                 ListTile(
                  //                   leading: const Icon(
                  //                     Icons.money_off_rounded,
                  //                   ),
                  //                   title: const Text(
                  //                     'Expense',
                  //                   ),
                  //                   onTap: () {
                  //                     setState(() {
                  //                       recordTypeIcon =
                  //                           const Icon(Icons.money_off_rounded);
                  //                       _selectedType = 'Expense';
                  //                     });
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //                 ListTile(
                  //                   leading: const Icon(
                  //                     Icons.attach_money_rounded,
                  //                   ),
                  //                   title: const Text(
                  //                     "Income",
                  //                   ),
                  //                   onTap: () {
                  //                     setState(() {
                  //                       recordTypeIcon = const Icon(
                  //                           Icons.attach_money_rounded);
                  //                       _selectedType = 'Income';
                  //                     });
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
