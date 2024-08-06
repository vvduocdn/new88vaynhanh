part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isSearch;
  final bool isLoadingRestaurant;
  final bool isDataEmpty;
  final bool isBottomNavigationShow;
  final bool isUpdateAvailable;
  final bool isHiddenLoadMore;
  final String address;
  final bool isLoadingMenuRestaurant;
  final bool isLoadingProductRestaurant;
  final bool isLoading;
  final DateTime? focusedDay;
  final DateTime? dateSelected;
  final String? sortDate;
  final String? fillterByDate;
  final bool isOrderSuccess;
  final bool isHistoryOrder;
  final bool isDetailOrder;
  final String recipient;
  final String phone;
  final bool isLoadMoreRestaurants;
  final bool isLoadingAds;
  final bool isLoadMoreHistoryOrder;
  final String statusHistoryOrder;
  final bool isLoadMoreProducts;
  final bool isLoadMoreNotification;
  final bool isLoadingNotification;
  final bool hasNew;
  final int money;

  const HomeState(
      {
      this.isLoadMoreNotification = false,
      this.isLoadingNotification = false,
      this.phone = '',
      this.statusHistoryOrder = '',
      this.recipient = '',
      this.focusedDay,
      this.money = 30000000,
      this.dateSelected,
      this.sortDate,
      this.fillterByDate,
      this.isSearch = false,
      this.isLoadingRestaurant = true,
      this.isDetailOrder = true,
      this.isUpdateAvailable = false,
      this.isDataEmpty = false,
      this.address = '',
      required this.isBottomNavigationShow,
      this.isHiddenLoadMore = false,
      this.isLoadingMenuRestaurant = false,
      this.isLoadingProductRestaurant = true,
      this.isLoading = false,
      this.isHistoryOrder = false,
      this.isOrderSuccess = false,
      this.isLoadMoreRestaurants = false,
      this.isLoadingAds = false,
      this.isLoadMoreHistoryOrder = false,
      this.isLoadMoreProducts = false,
      this.hasNew = false});

  HomeState copyWith(
      {bool? isSearch,
      String? linkOfMatchsDetail,
      bool? isLoadingRestaurant,
      bool? isUpdateAvailable,
      bool? isLiveStreamListLoading,
      bool? isBottomLiveStreamListLoading,
      bool? isDataEmpty,
      bool? isBottomNavigationShow,
      String? address,
      bool? isHiddenLoadMore,
      bool? isLoadingMenuRestaurant,
      bool? isLoadingProductRestaurant,
      bool? isLoading,
      DateTime? focusedDay,
      DateTime? dateSelected,
      String? sortDate,
      String? fillterByDate,
      bool? isOrderSuccess,
      bool? isHistoryOrder,
      bool? isDetailOrder,
      String? recipient,
      String? phone,
      bool? isLoadMoreRestaurants,
      bool? isLoadingAds,
      bool? isLoadMoreHistoryOrder,
      String? statusHistoryOrder,
      bool? isLoadMoreProducts,
      bool? isLoadMoreNotification,
      bool? isLoadingNotification,
      bool? hasNew,
      int? money,}) {
    return HomeState(

        isSearch: isSearch ?? this.isSearch,
        isLoadingRestaurant: isLoadingRestaurant ?? this.isLoadingRestaurant,
        isDataEmpty: isDataEmpty ?? this.isDataEmpty,
        isBottomNavigationShow:
            isBottomNavigationShow ?? this.isBottomNavigationShow,
        isUpdateAvailable: isUpdateAvailable ?? this.isUpdateAvailable,
        address: address ?? this.address,

        isLoadingMenuRestaurant:
            isLoadingMenuRestaurant ?? this.isLoadingMenuRestaurant,
        isHiddenLoadMore: isHiddenLoadMore ?? this.isHiddenLoadMore,
        isLoadingProductRestaurant:
            isLoadingProductRestaurant ?? this.isLoadingProductRestaurant,
        isLoading: isLoading ?? this.isLoading,
        sortDate: sortDate ?? this.sortDate,
        focusedDay: focusedDay ?? this.focusedDay,
        fillterByDate: fillterByDate ?? this.fillterByDate,
        dateSelected: dateSelected ?? this.dateSelected,
        isOrderSuccess: isOrderSuccess ?? this.isOrderSuccess,
        isHistoryOrder: isHistoryOrder ?? this.isHistoryOrder,
        isDetailOrder: isDetailOrder ?? this.isDetailOrder,
        recipient: recipient ?? this.recipient,
        phone: phone ?? this.phone,
        isLoadMoreRestaurants:
            isLoadMoreRestaurants ?? this.isLoadMoreRestaurants,
        isLoadingAds: isLoadingAds ?? this.isLoadingAds,
        isLoadMoreHistoryOrder:
            isLoadMoreHistoryOrder ?? this.isLoadMoreHistoryOrder,
        statusHistoryOrder: statusHistoryOrder ?? this.statusHistoryOrder,
        isLoadMoreProducts: isLoadMoreProducts ?? this.isLoadMoreProducts,
        isLoadMoreNotification:
            isLoadMoreNotification ?? this.isLoadMoreNotification,
        isLoadingNotification:
            isLoadingNotification ?? this.isLoadingNotification,
        money: money ?? this.money,
        hasNew: hasNew ?? this.hasNew);
  }

  factory HomeState.initial() {
    return const HomeState(
        phone: '',
        recipient: '',
        focusedDay: null,
        dateSelected: null,
        sortDate: null,
        fillterByDate: null,
        isSearch: false,
        isLoadingRestaurant: true,
        isDetailOrder: true,
        isUpdateAvailable: false,
        isDataEmpty: false,
        address: '',
        isBottomNavigationShow: true,
        isHiddenLoadMore: false,
        isLoadingMenuRestaurant: false,
        isLoadingProductRestaurant: true,
        isLoading: false,
        isHistoryOrder: false,
        isOrderSuccess: false,
        isLoadMoreRestaurants: false,
        isLoadingAds: false,
        isLoadMoreHistoryOrder: false,
        statusHistoryOrder: '',
        isLoadMoreProducts: false,
        isLoadMoreNotification: false,
        isLoadingNotification: false,
        money: 300000000,
        hasNew: false);
  }
  @override
  List<Object?> get props => [
        isSearch,
        isLoadingRestaurant,
        isDataEmpty,
        isBottomNavigationShow,
        isUpdateAvailable,
        isHiddenLoadMore,
        address,
        isLoadingMenuRestaurant,
        isLoadingProductRestaurant,
        isLoading,
        dateSelected,
        focusedDay,
        fillterByDate,
        sortDate,
        isOrderSuccess,
        isHistoryOrder,
        isDetailOrder,
        phone,
        recipient,
        isLoadMoreRestaurants,
        isLoadingAds,
        isLoadMoreHistoryOrder,
        statusHistoryOrder,
        isLoadMoreProducts,
        isLoadMoreNotification,
        isLoadingNotification,
        hasNew,
        money
      ];
}
