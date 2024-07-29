import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:manfaa/components/global_variables.dart';
import 'package:manfaa/features/landing_page/data/repository/landing_page_repository.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  final LandingPageRepostiory _landingPageRepostiory;

  LandingPageBloc(this._landingPageRepostiory)
      : super(
          LandingPageState(carouselController: CarouselController()),
        ) {
    on<ChangeSection>(_changeSection);
    on<Submit2Waitlist>(_submit2Waitlist);
    on<CloseRegisterSuccessDialog>(_closeRegisterSuccessDialog);
    on<ChangeLocale>(_changeLocale);
    on<Initialize>(_initialize);
  }

  Future<void> _changeSection(
    ChangeSection event,
    Emitter<LandingPageState> emit,
  ) async {
    emit(state.copyWith(currentSectionIndex: event.index));
    await state.carouselController?.animateToPage(
      event.index,
      duration: const Duration(milliseconds: 500),
    );
    event.onPop?.call();
  }

  Future<void> _initialize(
    Initialize event,
    Emitter<LandingPageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final locale = storageService.getLocale();
    emit(state.copyWith(locale: locale, isLoading: false));
  }

  Future<void> _changeLocale(
    ChangeLocale event,
    Emitter<LandingPageState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
  }

  Future<void> _submit2Waitlist(
    Submit2Waitlist event,
    Emitter<LandingPageState> emit,
  ) async {
    if (event.contactInformation.isEmpty) return;

    final result =
        await _landingPageRepostiory.submit2Waitlist(event.contactInformation);
    emit(state.copyWith(showRegisterSuccess: result));
  }

  Future<void> _closeRegisterSuccessDialog(
    CloseRegisterSuccessDialog event,
    Emitter<LandingPageState> emit,
  ) async {
    emit(state.copyWith(showRegisterSuccess: false));
  }
}
