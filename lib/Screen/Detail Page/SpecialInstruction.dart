import 'package:flutter/material.dart';

import '../../components/constrain.dart';

class specialInstruction extends StatefulWidget {
  const specialInstruction({super.key});

  @override
  State<specialInstruction> createState() => _specialInstructionState();
}

class _specialInstructionState extends State<specialInstruction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Special Instructions',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: KBlackColor,
          ),
        ),
        const SizedBox(
          height: 10,width: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Please let us know if you are allergic to anything or if we '
              'need to avoid anything',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: KBlackColor,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          maxLength: 500,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: 'e.g. mayo'
          ),
        ),
      ],
    );
  }
}
