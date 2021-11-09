import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/States/Provider/provider_class.dart';

class ProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = context.read<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title:  Text(
        "Provider",
        style: style,
      ),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<CounterProvider>(
        builder: (context, state, child) {
          return ConditionalBuilder(
            condition: counterProvider.axisUsersList != null,
            builder: (context) => ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: counterProvider.axisUsersList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(counterProvider.axisUsersList[index].name),
                  );
                }),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
          ),
        ),
      ),
    );
  }

  var style = TextStyle(fontSize: 20);
}
