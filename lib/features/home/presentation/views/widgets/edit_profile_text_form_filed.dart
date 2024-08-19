import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/uploa_use_details_cubit/upload_user_details_cubit.dart';

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
  String? phone, name;

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
                    hint: 'Your Name',
                    onSaved: (value) => name = value,
                    initialValue: state is FetchUserDataSuccess
                        ? state.userModel.name
                        : null,
                    validator: (value) => Validators.nameValidator(value),
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
                    onSaved: (value) => phone = value,
                    hint: 'Your phone number',
                    initialValue: state is FetchUserDataSuccess
                        ? state.userModel.phone
                        : null,
                    validator: (value) =>
                        Validators.phoneNumberValidator(value),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      FocusScope.of(context).unfocus();

                      if (state is FetchUserDataSuccess) {
                        bool isNameChanged = state.userModel.name != name;
                        bool isPhoneChanged = state.userModel.phone != phone;

                        if (isNameChanged || isPhoneChanged) {
                          BlocProvider.of<UploadUserDetailsCubit>(context)
                              .uploadUserDetails(
                            name: name!,
                            phone: phone!,
                          );

                          showedScaffoldMessage(
                              context: context,
                              message: 'Changed successfully ');
                        } else {
                          showedScaffoldMessage(
                              context: context, message: 'Data already used');
                        }
                      }

                      BlocProvider.of<UploadUserDetailsCubit>(context)
                          .uploadUserDetails(
                        name: name!,
                        phone: phone!,
                      );
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
