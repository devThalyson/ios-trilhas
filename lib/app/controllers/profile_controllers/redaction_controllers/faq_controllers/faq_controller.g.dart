// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaqController on _FaqControllerBase, Store {
  final _$faqsAtom = Atom(name: '_FaqControllerBase.faqs');

  @override
  List<Faq> get faqs {
    _$faqsAtom.reportRead();
    return super.faqs;
  }

  @override
  set faqs(List<Faq> value) {
    _$faqsAtom.reportWrite(value, super.faqs, () {
      super.faqs = value;
    });
  }

  final _$getFaqsProgressAtom =
      Atom(name: '_FaqControllerBase.getFaqsProgress');

  @override
  bool get getFaqsProgress {
    _$getFaqsProgressAtom.reportRead();
    return super.getFaqsProgress;
  }

  @override
  set getFaqsProgress(bool value) {
    _$getFaqsProgressAtom.reportWrite(value, super.getFaqsProgress, () {
      super.getFaqsProgress = value;
    });
  }

  final _$getFaqsAsyncAction = AsyncAction('_FaqControllerBase.getFaqs');

  @override
  Future getFaqs(BuildContext context) {
    return _$getFaqsAsyncAction.run(() => super.getFaqs(context));
  }

  @override
  String toString() {
    return '''
faqs: ${faqs},
getFaqsProgress: ${getFaqsProgress}
    ''';
  }
}
