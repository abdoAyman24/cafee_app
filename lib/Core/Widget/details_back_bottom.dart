import 'package:caffee/Feature/home/presentation/manager/Product_Size_cubit/product_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBackBottom extends StatelessWidget {
  const DetailsBackBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15,
      top: 15,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          context.read<ProductSizeCubit>().updateproductSize(
            ProductSize.smalle,
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 0.00),
              end: Alignment(1.00, 1.00),
              colors: [
                const Color(0xFF37373C),
                const Color(0xFF313139),
                Colors.black,
              ],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color.fromRGBO(19, 19, 19, 1),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
