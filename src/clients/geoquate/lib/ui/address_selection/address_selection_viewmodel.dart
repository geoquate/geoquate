import 'package:geoquate/api/firestore_api.dart';
import 'package:geoquate/app/app.locator.dart';
import 'package:geoquate/app/app.logger.dart';
import 'package:geoquate/app/app.router.dart';
import 'package:geoquate/constants/app_strings.dart';
import 'package:geoquate/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'address_selection_view.form.dart';

class AddressSelectionViewModel extends FormViewModel {
  final log = getLogger('AddressSelectionViewModel');

  final _dialogService = locator<DialogService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  // List<PlacesAutoCompleteResult> _autoCompleteResults = [];
  // PlacesAutoCompleteResult? _selectedResult;

  // bool get hasSelectedPlace => _selectedResult != null;

  // List<PlacesAutoCompleteResult> get autoCompleteResults =>
  //     _autoCompleteResults;

  // bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;

  /// Indicated whether the [BoxInputField] is focused or not
  /// We can use this property for animation to move the "search input" higher when the user focus's on it
  bool focus = false;

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (addressValue != null) {
      // final placesResults = await _placesService.getAutoComplete(addressValue!);

      // if (placesResults != null) {
      //   _autoCompleteResults = placesResults;
      //   notifyListeners();
      // }
    }
  }

  /// Gets the details from the Places Api and saves it to the backend
  Future<void> selectAddressSuggestion() async {
    // PlacesAutoCompleteResult selectedResult =
    //     autoCompleteResult ?? _selectedResult!;

    // log.i('Selected $selectedResult as the suggestion');

    if (true) {
      _dialogService.showDialog(
        title: InvalidAutoCompleteDialogTitle,
        description: InvalidAutoCompleteDialogDescription,
      );
    } else {
      setBusy(true);

      // final placeDetails =
      //     await _placesService.getPlaceDetails(selectedResult.placeId ?? '');
      // log.v('Place Details: $placeDetails');

      // final address = Address(
      //   placeId: placeDetails.placeId!,
      //   lattitude: placeDetails.lat ?? -1,
      //   longitute: placeDetails.lng ?? -1,
      //   city: placeDetails.city,
      //   postalCode: placeDetails.zip,
      //   state: placeDetails.state,
      //   street: placeDetails.streetLong ?? placeDetails.streetShort,
      // );

      // final saveSuccess = await _firestoreApi.saveAddress(
      //   address: address,
      //   user: _userService.currentUser,
      // );

      if (false) {
        log.v('Address save failed. Notify user to try again.');
        _dialogService.showDialog(
          title: AddressSaveFailedDialogTitle,
          description: AddressSaveFailedDialogDescription,
        );
      } else {
        log.v(
            'Address has been saved! We\'re ready to show them some products!');
        _navigationService.clearStackAndShow(Routes.homeView);
      }

      setBusy(false);
    }
  }

  void setSelectedSuggestion() {
    // log.i('autoCompleteResult:$autoCompleteResult');
    // _selectedResult = autoCompleteResult;

    // _autoCompleteResults.clear();

    notifyListeners();
  }

  /// Updates the [BoxInputField] focus state
  void onFocusChanged(bool isFocus) {
    this.focus = isFocus;
    notifyListeners();
  }
}
