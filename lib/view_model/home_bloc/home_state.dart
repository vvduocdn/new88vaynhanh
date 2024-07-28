part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isSearch;
  final bool isLoadingRestaurant;
  final List<RestaurantModelData>? restaurants;
  final List<RestaurantModelData>? searchRestaurants;
  final RestaurantModelData? selectedRestaurants;
  final List<MenuRestaurantModel>? restaurantsMenu;
  final List<ProductModel>? restaurantsProducts;
  final bool isDataEmpty;
  final bool isBottomNavigationShow;
  final bool isUpdateAvailable;
  final bool isHiddenLoadMore;
  final String address;
  final bool isLoadingMenuRestaurant;
  final bool isLoadingProductRestaurant;
  final CartModel? carts;
  final bool isStatusAddCart;
  final List<OptionsProduct>? options;
  final MenuRestaurantModel? menuSelected;
  final int quantity;
  final bool isLoading;
  final DateTime? focusedDay;
  final DateTime? dateSelected;
  final String? sortDate;
  final String? fillterByDate;
  final bool isOrderSuccess;
  final List<HistoryOrderModel>? historyOrders;
  final bool isHistoryOrder;
  final bool isDetailOrder;
  final String recipient;
  final String phone;
  final bool isLoadMoreRestaurants;
  final List<BannerModel>? listAds;
  final bool isLoadingAds;
  final bool isLoadMoreHistoryOrder;
  final String statusHistoryOrder;
  final bool isLoadMoreProducts;
  final bool isLoadMoreNotification;
  final List<NotificationModel>? notifications;
  final bool isLoadingNotification;
  final bool hasNew;
  final OrderAddressModel? orderAddressModel;
  final List<OrderAddressModel>? orderAddresss;

  const HomeState(
      {this.orderAddressModel,
      this.orderAddresss,
      this.isLoadMoreNotification = false,
      this.isLoadingNotification = false,
      this.notifications,
      this.phone = '',
      this.statusHistoryOrder = '',
      this.recipient = '',
      this.focusedDay,
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
      this.restaurantsProducts,
      this.restaurants,
      this.searchRestaurants,
      this.restaurantsMenu,
      this.isStatusAddCart = false,
      this.carts,
      this.options,
      this.quantity = 1,
      this.menuSelected,
      this.selectedRestaurants,
      this.isLoading = false,
      this.isHistoryOrder = false,
      this.historyOrders,
      this.isOrderSuccess = false,
      this.isLoadMoreRestaurants = false,
      this.isLoadingAds = false,
      this.listAds,
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
      List<RestaurantModelData>? restaurants,
      List<RestaurantModelData>? searchRestaurants,
      List<MenuRestaurantModel>? restaurantsMenu,
      bool? isLoadingMenuRestaurant,
      List<ProductModel>? restaurantsProducts,
      bool? isLoadingProductRestaurant,
      CartModel? carts,
      bool? isStatusAddCart,
      List<OptionsProduct>? options,
      MenuRestaurantModel? menuSelected,
      int? quantity,
      RestaurantModelData? selectedRestaurants,
      bool? isLoading,
      DateTime? focusedDay,
      DateTime? dateSelected,
      String? sortDate,
      String? fillterByDate,
      bool? isOrderSuccess,
      List<HistoryOrderModel>? historyOrders,
      bool? isHistoryOrder,
      bool? isDetailOrder,
      String? recipient,
      String? phone,
      bool? isLoadMoreRestaurants,
      List<BannerModel>? listAds,
      bool? isLoadingAds,
      bool? isLoadMoreHistoryOrder,
      String? statusHistoryOrder,
      bool? isLoadMoreProducts,
      bool? isLoadMoreNotification,
      List<NotificationModel>? notifications,
      bool? isLoadingNotification,
      bool? hasNew,
      OrderAddressModel? orderAddressModel,
      List<OrderAddressModel>? orderAddresss}) {
    return HomeState(
        orderAddresss: orderAddresss ?? this.orderAddresss,
        orderAddressModel: orderAddressModel ?? this.orderAddressModel,
        isSearch: isSearch ?? this.isSearch,
        isLoadingRestaurant: isLoadingRestaurant ?? this.isLoadingRestaurant,
        isDataEmpty: isDataEmpty ?? this.isDataEmpty,
        isBottomNavigationShow:
            isBottomNavigationShow ?? this.isBottomNavigationShow,
        isUpdateAvailable: isUpdateAvailable ?? this.isUpdateAvailable,
        address: address ?? this.address,
        restaurants: restaurants ?? this.restaurants,
        restaurantsMenu: restaurantsMenu ?? this.restaurantsMenu,
        isLoadingMenuRestaurant:
            isLoadingMenuRestaurant ?? this.isLoadingMenuRestaurant,
        isHiddenLoadMore: isHiddenLoadMore ?? this.isHiddenLoadMore,
        restaurantsProducts: restaurantsProducts ?? this.restaurantsProducts,
        isLoadingProductRestaurant:
            isLoadingProductRestaurant ?? this.isLoadingProductRestaurant,
        isStatusAddCart: isStatusAddCart ?? this.isStatusAddCart,
        carts: carts ?? this.carts,
        searchRestaurants: searchRestaurants ?? this.searchRestaurants,
        menuSelected: menuSelected ?? this.menuSelected,
        quantity: quantity ?? this.quantity,
        options: options ?? this.options,
        selectedRestaurants: selectedRestaurants ?? this.selectedRestaurants,
        isLoading: isLoading ?? this.isLoading,
        sortDate: sortDate ?? this.sortDate,
        focusedDay: focusedDay ?? this.focusedDay,
        fillterByDate: fillterByDate ?? this.fillterByDate,
        dateSelected: dateSelected ?? this.dateSelected,
        isOrderSuccess: isOrderSuccess ?? this.isOrderSuccess,
        historyOrders: historyOrders ?? this.historyOrders,
        isHistoryOrder: isHistoryOrder ?? this.isHistoryOrder,
        isDetailOrder: isDetailOrder ?? this.isDetailOrder,
        recipient: recipient ?? this.recipient,
        phone: phone ?? this.phone,
        listAds: listAds ?? this.listAds,
        isLoadMoreRestaurants:
            isLoadMoreRestaurants ?? this.isLoadMoreRestaurants,
        isLoadingAds: isLoadingAds ?? this.isLoadingAds,
        isLoadMoreHistoryOrder:
            isLoadMoreHistoryOrder ?? this.isLoadMoreHistoryOrder,
        statusHistoryOrder: statusHistoryOrder ?? this.statusHistoryOrder,
        isLoadMoreProducts: isLoadMoreProducts ?? this.isLoadMoreProducts,
        isLoadMoreNotification:
            isLoadMoreNotification ?? this.isLoadMoreNotification,
        notifications: notifications ?? this.notifications,
        isLoadingNotification:
            isLoadingNotification ?? this.isLoadingNotification,
        hasNew: hasNew ?? this.hasNew);
  }

  factory HomeState.initial() {
    return const HomeState(
        orderAddressModel: null,
        orderAddresss: [],
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
        restaurantsProducts: [],
        restaurants: [],
        searchRestaurants: [],
        restaurantsMenu: [],
        isStatusAddCart: false,
        carts: null,
        options: [],
        quantity: 1,
        menuSelected: null,
        selectedRestaurants: null,
        isLoading: false,
        isHistoryOrder: false,
        historyOrders: [],
        isOrderSuccess: false,
        isLoadMoreRestaurants: false,
        isLoadingAds: false,
        listAds: [],
        isLoadMoreHistoryOrder: false,
        statusHistoryOrder: '',
        isLoadMoreProducts: false,
        notifications: [],
        isLoadMoreNotification: false,
        isLoadingNotification: false,
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
        restaurants,
        restaurantsMenu,
        isLoadingMenuRestaurant,
        isLoadingProductRestaurant,
        restaurantsProducts,
        carts,
        isStatusAddCart,
        options,
        searchRestaurants,
        menuSelected,
        quantity,
        selectedRestaurants,
        isLoading,
        dateSelected,
        focusedDay,
        fillterByDate,
        sortDate,
        isOrderSuccess,
        historyOrders,
        isHistoryOrder,
        isDetailOrder,
        phone,
        recipient,
        isLoadMoreRestaurants,
        listAds,
        isLoadingAds,
        isLoadMoreHistoryOrder,
        statusHistoryOrder,
        isLoadMoreProducts,
        notifications,
        isLoadMoreNotification,
        isLoadingNotification,
        hasNew,
        orderAddresss,
        orderAddressModel
      ];
}
