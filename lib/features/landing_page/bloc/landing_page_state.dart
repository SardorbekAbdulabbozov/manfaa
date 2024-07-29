part of 'landing_page_bloc.dart';

class LandingPageState extends Equatable {
  const LandingPageState({
    this.currentSectionIndex = 0,
    this.locale = 'en',
    this.isLoading = false,
    this.showRegisterSuccess = false,
    this.carouselController,
  });

  final int currentSectionIndex;
  final String locale;
  final bool isLoading;
  final bool showRegisterSuccess;
  final CarouselController? carouselController;

  LandingPageState copyWith({
    int? currentSectionIndex,
    String? locale,
    bool? isLoading,
    bool? showRegisterSuccess,
    CarouselController? carouselController,
  }) {
    return LandingPageState(
      currentSectionIndex: currentSectionIndex ?? this.currentSectionIndex,
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      showRegisterSuccess: showRegisterSuccess ?? this.showRegisterSuccess,
      carouselController: carouselController ?? this.carouselController,
    );
  }

  @override
  List<Object?> get props => [
        currentSectionIndex,
        locale,
        isLoading,
        showRegisterSuccess,
        carouselController,
      ];
}
