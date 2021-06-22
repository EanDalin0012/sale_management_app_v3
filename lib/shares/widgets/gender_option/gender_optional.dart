import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class GenderForm extends FormField<String> {
  GenderForm({
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    required ValueChanged<String> onChanged,
    String ? initialValue,
    required Size size,
  }) :super(
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<String> state) {
        var validateColor = state.hasError ? Colors.red : Colors.white;
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('genderForm.label.gender'.tr()),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      state.didChange('m');
                      onChanged('m');
                    },
                    child: Container(
                      width: (size.width / 2) - 40,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: initialValue != null
                            ? Colors.white
                            : validateColor),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('genderForm.label.male'.tr()),
                          ),
                          Radio(
                              value: 'm',
                              activeColor: Colors.white,
                              groupValue: initialValue,
                              onChanged: (v) => onChanged(v.toString())
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      state.didChange('f');
                      onChanged('f');
                    },
                    child: Container(
                      width: (size.width / 2) - 40,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: initialValue != null
                            ? Colors.white
                            : validateColor),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('genderForm.label.female'.tr()),
                          ),
                          Radio(
                              value: 'f',
                              activeColor: Colors.white,
                              groupValue: initialValue,
                              onChanged: (v) => onChanged(v.toString())
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              state.hasError ? Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red
                  ),
                ),
              ) : Container()
            ]
        );
      });
}
