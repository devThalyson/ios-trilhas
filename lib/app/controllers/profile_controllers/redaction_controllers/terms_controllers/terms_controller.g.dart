// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TermsController on _TermsControllerBase, Store {
  final _$termsAtom = Atom(name: '_TermsControllerBase.terms');

  @override
  List<Term> get terms {
    _$termsAtom.reportRead();
    return super.terms;
  }

  @override
  set terms(List<Term> value) {
    _$termsAtom.reportWrite(value, super.terms, () {
      super.terms = value;
    });
  }

  final _$getTermsProgressAtom =
      Atom(name: '_TermsControllerBase.getTermsProgress');

  @override
  bool get getTermsProgress {
    _$getTermsProgressAtom.reportRead();
    return super.getTermsProgress;
  }

  @override
  set getTermsProgress(bool value) {
    _$getTermsProgressAtom.reportWrite(value, super.getTermsProgress, () {
      super.getTermsProgress = value;
    });
  }

  final _$getTermsAsyncAction = AsyncAction('_TermsControllerBase.getTerms');

  @override
  Future getTerms(BuildContext context) {
    return _$getTermsAsyncAction.run(() => super.getTerms(context));
  }

  @override
  String toString() {
    return '''
terms: ${terms},
getTermsProgress: ${getTermsProgress}
    ''';
  }
}
