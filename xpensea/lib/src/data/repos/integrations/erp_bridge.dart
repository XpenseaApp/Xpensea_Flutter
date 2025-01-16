/// Abstract base class for ERP system integrations
abstract class ERPBridge {
  /// Fetch employee data from the ERP system
  Future<List<Employee>> getEmployees();

  /// Update employee salary data in the ERP system
  Future<bool> updateEmployeeSalary(String employeeId, double newSalary);
}

/// SAP ERP system implementation
class SAPBridge extends ERPBridge {
  final String _apiUrl;
  final String _apiKey;

  SAPBridge({required String apiUrl, required String apiKey})
      : _apiUrl = apiUrl,
        _apiKey = apiKey;

  @override
  Future<List<Employee>> getEmployees() async {
    // TODO: Implement SAP API call to fetch employees
    throw UnimplementedError();
  }

  @override
  Future<bool> updateEmployeeSalary(String employeeId, double newSalary) async {
    // TODO: Implement SAP API call to update employee salary
    throw UnimplementedError();
  }
}

/// Generic HRMS system implementation
class GenericHRMSBridge extends ERPBridge {
  final String _apiUrl;
  final String _username;
  final String _password;

  GenericHRMSBridge({
    required String apiUrl,
    required String username,
    required String password,
  })  : _apiUrl = apiUrl,
        _username = username,
        _password = password;

  @override
  Future<List<Employee>> getEmployees() async {
    // TODO: Implement generic HRMS API call to fetch employees
    throw UnimplementedError();
  }

  @override
  Future<bool> updateEmployeeSalary(String employeeId, double newSalary) async {
    // TODO: Implement generic HRMS API call to update employee salary
    throw UnimplementedError();
  }
}

/// Employee data model
class Employee {
  final String id;
  final String name;
  final String department;
  double salary;

  Employee({
    required this.id,
    required this.name,
    required this.department,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      department: json['department'],
      salary: json['salary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'department': department,
      'salary': salary,
    };
  }
}
