import 'package:email_validator/email_validator.dart';

String? emailValidator(email) =>
    email != null && !EmailValidator.validate(email)
        ? 'Masukan email yang benar!'
        : null;

String? passValidator(pass) =>
    pass != null && pass.length < 6 ? 'Masukan minimal 6 karakter' : null;
