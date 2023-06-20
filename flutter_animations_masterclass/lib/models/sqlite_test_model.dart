class SqliteTestModel {
  final int? No;
  final String? UserID;
  final String? Content;
  final String? RecordDate;

  SqliteTestModel({this.No, this.UserID, this.Content, this.RecordDate});

  Map<String, dynamic> toMap() => {
        'UserID': this.UserID,
        'Content': this.Content,
        'RecordDate': this.RecordDate
      };
}
