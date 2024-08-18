import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_data_cubit/fetch_user_data_cubit.dart';

class EditProfileTextFormFileds extends StatefulWidget {
  const EditProfileTextFormFileds({
    super.key,
  });

  @override
  State<EditProfileTextFormFileds> createState() =>
      _EditProfileTextFormFiledsState();
}

class _EditProfileTextFormFiledsState extends State<EditProfileTextFormFileds> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, name;
  int? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserDataCubit, FetchUserDataState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13.0,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14),
                Text(
                  'Name',
                  style: AppStyles.styleGreyReg18(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: CustomTextFromField(
                    hint: state is FetchUserDataSuccess
                        ? state.userModel.name
                        : 'eee',
                    onSaved: (value) {
                      email = value;
                    },
                    validator: (value) => Validators.nameValidator(value),
                  ),
                ),
                Text(
                  'Email',
                  style: AppStyles.styleGreyReg18(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: CustomTextFromField(
                    hint: 'dd',
                    validator: (value) => Validators.emailValidator(value),
                  ),
                ),
                Text(
                  'Phone Number',
                  style: AppStyles.styleGreyReg18(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: CustomTextFromField(
                    hint: 'dd',
                    validator: (value) =>
                        Validators.phoneNumberValidator(value),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      FocusScope.of(context).unfocus();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child: Center(
                    child: Text(
                      'Submit',
                      style: AppStyles.styleRegular18(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
