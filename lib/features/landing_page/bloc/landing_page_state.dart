part of 'landing_page_bloc.dart';

class LandingPageState extends Equatable {
  const LandingPageState({
    this.currentSectionIndex = 0,
    this.isLoading = false,
    this.showRegisterSuccess = false,
    this.carouselController,
  });

  final int currentSectionIndex;
  final bool isLoading;
  final bool showRegisterSuccess;
  final CarouselController? carouselController;

  LandingPageState copyWith({
    int? currentSectionIndex,
    bool? isLoading,
    bool? showRegisterSuccess,
    CarouselController? carouselController,
  }) {
    return LandingPageState(
      currentSectionIndex: currentSectionIndex ?? this.currentSectionIndex,
      isLoading: isLoading ?? this.isLoading,
      showRegisterSuccess: showRegisterSuccess ?? this.showRegisterSuccess,
      carouselController: carouselController ?? this.carouselController,
    );
  }

  @override
  List<Object?> get props => [
        currentSectionIndex,
        isLoading,
        showRegisterSuccess,
        carouselController,
      ];
}
