class UserModel {
  int employeeID;
  String firstName;
  String lastName;
  String email;
  String phone;

  UserModel(
    {
      required this.employeeID, 
      required this.firstName, 
      required this.lastName,
      required this.email,
      required this.phone
    }
  );
}