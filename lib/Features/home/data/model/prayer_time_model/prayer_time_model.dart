import 'package:equatable/equatable.dart';

import 'item.dart';


class PrayerTimeModel extends Equatable {
  
  final List<Item>? items;
  

  const PrayerTimeModel({
    
    this.items,
    
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
     
    );
  }

  Map<String, dynamic> toJson() => {
      
        if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
        
      };

  @override
  List<Object?> get props {
    return [
     
      items,
     
    ];
  }
}