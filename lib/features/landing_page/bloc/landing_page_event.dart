part of 'landing_page_bloc.dart';

abstract class LandingPageEvent extends Equatable {
  const LandingPageEvent();
}

class ChangeSection extends LandingPageEvent {
  final int index;
  final void Function()? onPop;

  const ChangeSection({
    required this.index,
    this.onPop,
  });

  @override
  List<Object?> get props => [index, onPop];
}

class Submit2Waitlist extends LandingPageEvent {
  final String contactInformation;

  const Submit2Waitlist(this.contactInformation);

  @override
  List<Object?> get props => [contactInformation];
}

class CloseRegisterSuccessDialog extends LandingPageEvent {

  const CloseRegisterSuccessDialog();

  @override
  List<Object?> get props => [];
}
