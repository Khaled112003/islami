class DoaaModel {
  final String id;
  
  final String content;

  DoaaModel({
    required this.id,
   
    required this.content,
  });

 
  factory DoaaModel.fromFirestore(Map<String, dynamic> data) {
    return DoaaModel(
      id: data['id'] ?? '',        
     
      content: data['content'] ?? '',
    );
  }
}
