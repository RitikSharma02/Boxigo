
class CustomerDataModel {
  final String estimateId;
  final String movingFrom;
  final String movingTo;
  final DateTime movingOn;
  final String distance;
  final String propertySize;
  final String totalItems;
  final Address fromAddress;
  final Address toAddress;
  final String serviceType;
  final dynamic storageItems;
  final dynamic toCity;
  final dynamic fromCity;

  final dynamic old_floor_no;
  final dynamic new_floor_no;
  final dynamic old_elevator_availability;
  final dynamic new_elevator_availability;
  final dynamic old_parking_distance;
  final dynamic new_parking_distance;
  final dynamic old_house_additional_info;
  final dynamic new_house_additional_info;
  final dynamic unpacking_service;
  final dynamic packing_service;




  final Items? items;

  CustomerDataModel({
    required this.estimateId,
    required this.movingFrom,
    required this.movingTo,
    required this.movingOn,
    required this.distance,
    required this.propertySize,
    required this.totalItems,
    required this.fromAddress,
    required this.toAddress,
    required this.serviceType,
    this.storageItems,
    this.toCity,
    this.fromCity,
    this.items,
    this.old_floor_no,
    this.new_floor_no,
    this.old_elevator_availability,
    this.new_elevator_availability,
    this.old_parking_distance,
    this.new_parking_distance,
    this.old_house_additional_info,
    this.new_house_additional_info,
    this.unpacking_service,
    this.packing_service,



  });

  factory CustomerDataModel.fromJson(Map<String, dynamic> json) {
    return CustomerDataModel(
      estimateId: json['estimate_id'],
      toCity  : json['to_address']['toCity'],
      fromCity  : json['from_address']['fromCity'],
      // userId: json['user_id'],
      movingFrom: json['moving_from'],
      movingTo: json['moving_to'],
      movingOn: DateTime.parse(json['moving_on']),
      distance: json['distance'],
      propertySize: json['property_size'],
      totalItems: json['total_items'],
      fromAddress: Address.fromJson(json['from_address']),
      toAddress: Address.fromJson(json['to_address']),
      serviceType: json['service_type'],
      storageItems: json['storage_items'],
      items: json['items'] != null ? Items.fromJson(json['items']) : null,

        old_floor_no: json['old_floor_no'],
        new_floor_no: json['new_floor_no'],
        old_elevator_availability : json['old_elevator_availability'],
        new_elevator_availability: json['new_elevator_availability'],
        old_parking_distance: json['old_parking_distance'],
        new_parking_distance: json['new_parking_distance'],
        old_house_additional_info: json['old_house_additional_info'],
        new_house_additional_info: json['new_house_additional_info'],
        unpacking_service: json['unpacking_service'],
        packing_service: json['packing_service'],



    );

  }

}

class Items {
  final List<Inventory> inventory;
  final CustomItems? customItems;

  Items({required this.inventory, this.customItems});

  factory Items.fromJson(Map<String, dynamic> json) {
    var inventoryList = json['inventory'] as List;
    List<Inventory> inventory = inventoryList.map((i) => Inventory.fromJson(i)).toList();
    return Items(
      inventory: inventory,
      customItems: json['customItems'] != null ? CustomItems.fromJson(json['customItems']) : null,
    );
  }
}

class CustomItems {
  final String units;
  final List<CustomItem> items;

  CustomItems({required this.units, required this.items});

  factory CustomItems.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<CustomItem> items = itemsList.map((i) => CustomItem.fromJson(i)).toList();
    return CustomItems(
      units: json['units'],
      items: items,
    );
  }
}

class CustomItem {
  final String id;
  final String itemHeight;
  final String itemLength;
  final String itemQty;
  final String itemWidth;
  final String itemDescription;
  final String itemName;

  CustomItem({
    required this.id,
    required this.itemHeight,
    required this.itemLength,
    required this.itemQty,
    required this.itemWidth,
    required this.itemDescription,
    required this.itemName,
  });

  factory CustomItem.fromJson(Map<String, dynamic> json) {
    return CustomItem(
      id: json['id'],
      itemHeight: json['item_height'],
      itemLength: json['item_length'],
      itemQty: json['item_qty'],
      itemWidth: json['item_width'],
      itemDescription: json['item_description'],
      itemName: json['item_name'],
    );
  }
}



class Inventory {
  final String id;
  final int order;
  final String name;
  final String displayName;
  final List<Category> category;

  Inventory({
    required this.id,
    required this.order,
    required this.name,
    required this.displayName,
    required this.category,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    var categoryList = json['category'] as List;
    List<Category> category = categoryList.map((i) => Category.fromJson(i)).toList();
    return Inventory(
      id: json['id'],
      order: json['order'],
      name: json['name'],
      displayName: json['displayName'],
      category: category,
    );
  }
}

class Category {
  final String id;
  final String name;
  final String displayName;
  final List<Item> items;

  Category({
    required this.id,
    required this.name,
    required this.displayName,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<Item> items = itemsList.map((i) => Item.fromJson(i)).toList();
    return Category(
      id: json['id'],
      name: json['name'],
      displayName: json['displayName'],
      items: items,
    );
  }
}

class Item {
  final String id;
  final String name;
  final String displayName;
  final int qty;
  final List<TypeOption> type;

  Item({
    required this.id,
    required this.name,
    required this.displayName,
    required this.qty,
    required this.type,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    var typeList = json['type'] as List;
    List<TypeOption> type = typeList.map((i) => TypeOption.fromJson(i)).toList();
    return Item(
      id: json['id'],
      name: json['name'],
      displayName: json['displayName'],
      qty: json['qty'],
      type: type,
    );
  }
}

class TypeOption {
  final String id;
  final String option;
  final bool selected;

  TypeOption({required this.id, required this.option, required this.selected});

  factory TypeOption.fromJson(Map<String, dynamic> json) {
    return TypeOption(
      id: json['id'],
      option: json['option'],
      selected: json['selected'],
    );
  }
}


class SizeOption {
  final String option;
  final bool selected;

  SizeOption({required this.option, required this.selected});

  factory SizeOption.fromJson(Map<String, dynamic> json) {
    return SizeOption(
      option: json['option'],
      selected: json['selected'],
    );
  }
}

class Address {
  final String firstName;
  final String lastName;
  final String address;
  final String locality;
  final String city;
  final String state;
  final String pincode;

  Address({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.locality,
    required this.city,
    required this.state,
    required this.pincode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['fromAddress'] ?? json['toAddress'],
      locality: json['fromLocality'] ?? json['toLocality'],
      city: json['fromCity'] ?? json['toCity'],
      state: json['fromState'] ?? json['toState'],
      pincode: json['pincode'],

    );

  }
}


