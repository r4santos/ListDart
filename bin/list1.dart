import 'dart:ffi';
import 'dart:io';

void main() {
  bool infinit = false;
  while (!infinit) {
    print("-" * 40);
    print("Choose an option below: ");
    print("1 - Name and age");
    print("2 - Brand, car and price");
    print("3 - Bank Account");
    print("4 - Student average");
    print("5 - Product");
    print("6 - Employee");
    print("7 - Registration of people");
    print("8 - Exit");
    print("-" * 40);

    stdout.write("=> ");
    String? r = stdin.readLineSync();

    switch (r) {
      case "1":
        bool exit = false;
        while (!exit) {
          print("-" * 40);
          stdout.write("Enter your name: ");
          String? name = stdin.readLineSync();
          People p = People(name!);

          stdout.write("Enter your age: ");
          String? age = stdin.readLineSync();
          if (age != null) {
            try {
              int valueAge = int.parse(age);
              p.setAge = valueAge;
            } catch (e) {
              print("Erro $e");
            }
          } else {
            print("Inválid value");
          }

          print("-" * 40);
          p.displayDate();

          print("-" * 40);
          print("1 - Restart");
          print("2 - Exit");
          stdout.write("=> ");
          String? choice = stdin.readLineSync();
          switch (choice) {
            case "1":
              print("-" * 40);
              break;
            case "2":
              exit = true;
              break;
            default:
              print("Ther is no such value");
              break;
          }
        }

        enter();
        break;
      case "2":
        bool exit = false;
        while (!exit) {
          print("-" * 40);

          stdout.write("Enter the car brand: ");
          String? brand = stdin.readLineSync();

          stdout.write("Enter the car name: ");
          String? name = stdin.readLineSync();

          Car c = Car(brand!, name!);

          stdout.write("Enter the car price: ");
          String? price = stdin.readLineSync();

          if (price != null) {
            double valuePrice = double.parse(price);
            c.setPrice = valuePrice;
          } else {
            print("Inválid price");
          }

          c.displayDate();

          print("-" * 40);
          print("1 - Restart");
          print("2 - Alter price and restart");
          print("3 - Exit");
          stdout.write("=> ");
          String? choice = stdin.readLineSync();
          switch (choice) {
            case "1":
              print("-" * 40);
              break;
            case "2":
              print("-" * 40);
              stdout.write("Enter new $name price: ");
              String? x = stdin.readLineSync();
              if (x != null) {
                double valuePrice = double.parse(x);
                c.setPrice = valuePrice;
              } else {
                print("Inválid price");
              }

              print("-" * 40);
              c.displayDate();

              break;
            case "3":
              exit = true;
              break;
            default:
              print("Ther is no such value");
              break;
          }
        }

        enter();
        break;
      case "3":
        print("-" * 40);
        stdout.write("Hi! Enter your name and create your \nnew account: ");
        String? name = stdin.readLineSync();

        BackAccount b = BackAccount(name);

        print("-" * 40);
        print("Welcome Sr.(a) $name \n");

        stdout.write("Enter your current balance: ");
        String? balance = stdin.readLineSync();
        if (balance != null) {
          try {
            double valueBalance = double.parse(balance);
            b.setBalance = valueBalance;

            bool exit = false;
            while (!exit) {
              print("-" * 40);
              print("Chose the best option for you:");
              print("1 - Deposit");
              print("2 - Cash out");
              print("3 - Balance");
              print("4 - Exit");
              stdout.write("=> ");
              String? choice = stdin.readLineSync();

              switch (choice) {
                case "1":
                  print("-" * 40);
                  stdout.write("Enter the deposit amount: ");
                  String value = stdin.readLineSync() ?? "";
                  double newValue = double.parse(value);
                  b.deposit(newValue);
                  break;
                case "2":
                  print("-" * 40);
                  stdout.write("Enter withdrawal amount: ");
                  String value = stdin.readLineSync() ?? "";
                  double newValue = double.parse(value);
                  b.withDraw(newValue);
                  break;
                case "3":
                  print("-" * 40);
                  b.displayDetails();
                  break;
                case "4":
                  exit = true;
                  break;
                default:
                  print("Ther is no such value");
              }
            }
          } catch (e) {
            print("Erro $e");
          }
        }

        enter();
        break;
      case "4":
        bool close = false;
        while (!close) {
          print("-" * 40);
          print("Hello! Here you calculate \nyour school average\n");
          stdout.write("Enter your name: ");
          String? name = stdin.readLineSync();
          Student s = Student(name!);

          print(" ");
          stdout.write("Enter your first note: ");
          String? n1 = stdin.readLineSync();
          stdout.write("Enter your second note: ");
          String? n2 = stdin.readLineSync();

          if (n1 != null && n2 != null) {
            try {
              double grade1 = double.parse(n1);
              double grade2 = double.parse(n2);

              s.setGrade1 = grade1;
              s.setGrade2 = grade2;

              print("-" * 40);
              s.displayDetails();
            } catch (e) {
              print("Erro $e");
            }
          }

          print("-" * 40);
          print("1 - Restart");
          print("2 - Exit");
          stdout.write("=> ");
          String? choice = stdin.readLineSync();
          switch (choice) {
            case "1":
              print("-" * 40);
              break;
            case "2":
              close = true;
              break;
            default:
              print("Ther is no such value");
              break;
          }
        }

        enter();
        break;
      case "5":
        bool close = false;
        while (!close) {
          print("-" * 40);
          print("1 - Add product");
          print("2 - Add product and a discount to it");
          print("3 - Exit");
          stdout.write("=> ");
          String? choice = stdin.readLineSync();
          switch (choice) {
            case "1":
              print("-" * 40);
              stdout.write("Enter the product name: ");
              String? name = stdin.readLineSync();

              Product p = Product(name);

              stdout.write("Enter the product price: ");
              String x = stdin.readLineSync() ?? "";
              double price = double.parse(x);

              p.productPrice = price;
              p.displayDate();
              break;
            case "2":
              print("-" * 40);
              stdout.write("Enter the product name: ");
              String? name = stdin.readLineSync() ?? "";

              stdout.write("Enter the product price: ");
              String? p = stdin.readLineSync() ?? "";
              double price = double.parse(p); //AQUI

              stdout.write("Enter the product discount: ");
              String? d = stdin.readLineSync() ?? "";
              double discount = double.parse(d);

              Product p1 = Product.discount(name, price, discount);

              p1.displayDate();

              break;
            case "3":
              close = true;
            default:
              print("Ther is no such value");
              break;
          }
        }

        enter();
        break;
      case "6":
        bool close = false;
        while (!close) {
          print("-" * 40);
          stdout.write("Enter the employee´s name: ");
          String name = stdin.readLineSync() ?? "";

          stdout.write("Enter the employee´s salary: ");
          String s = stdin.readLineSync() ?? "";
          double salary = double.parse(s);

          Employee f = Employee(name);
          f.addSalary = salary;

          print("-" * 40);
          stdout.write("Enter the porcentage of the salary encrease: ");
          String e = stdin.readLineSync() ?? "";
          double encrease = double.parse(e);

          f.increaseSalary(encrease);

          f.displayDate();

          print("-" * 40);
          print("1 - Restart");
          print("2 - Exit");
          stdout.write("=> ");
          String choice = stdin.readLineSync() ?? "";

          switch (choice) {
            case "1":
              break;
            case "2":
              close = true;
              break;
            default:
              print("Ther is no such value");
              break;
          }
        }

        enter();
        break;
      case "7":
        bool close = false;
         Cadaster c = Cadaster();

        while (!close) {
         

          print("-" * 40);
          print("1 - add people");
          print('2 - List people');
          print('3 - Exit');
          stdout.write('=> ');

          String choice = stdin.readLineSync() ?? '';
          switch (choice) {
            case '1':
              print("-" * 40);
              stdout.write('Enter people´s name: ');
              String name = stdin.readLineSync() ?? '';

              c.addPeople(name);
              break;
            case '2':
              print('-' * 40);
              c.listPeople();
            case '3':
              close = true;
              break;
            default:
              print("Ther is no such value");
              break;
          }
        }

        break;
      case "8":
        infinit = true;
        break;
      default:
        print("Ther is no such value");
    }
  }
}

void enter() {
  stdout.write("Press ENTER to exit");
  stdin.readLineSync();
}

class People {
  final String name;
  late int _age;

  People(this.name);

  set setAge(int age) {
    if (age >= 0) {
      _age = age;
    }
  }

  int getAge() => _age;

  void displayDate() {
    print("Name: $name \nAge: $_age");
  }
}

class Car {
  final String brand;
  final String model;
  late double _price;

  Car(this.brand, this.model);

  set setPrice(double newPrice) {
    if (newPrice >= 0) {
      _price = newPrice;
    } else {
      print("Erro: O preço não pode ser negativo.");
    }
  }

  get getPrice => _price;

  void displayDate() {
    print(
      "Brand: $brand \nModel: $model \nPrice: ${_price.toStringAsFixed(2)}",
    );
  }
}

class BackAccount {
  late final String? holder;
  late double _balance;

  BackAccount(this.holder);

  set setBalance(double balance) {
    _balance = balance;
  }

  get getBalance => _balance;

  void deposit(double value) {
    setBalance = getBalance + value;
  }

  void withDraw(double value) {
    if (value < getBalance) {
      setBalance = getBalance - value;
    } else {
      print("The desired amount is greater than \nthe available balance");
    }
  }

  void displayDetails() {
    print("Holder Account: $holder \nBalance: ${_balance.toStringAsFixed(2)}");
  }
}

class Student {
  final String name;
  late double _grade1;
  late double _grade2;

  Student(this.name);

  get getGrade1 => _grade1;

  set setGrade1(double grade) {
    if (grade >= 0 && grade <= 10) {
      _grade1 = grade;
    } else {
      throw ArgumentError("A nota 1 deve estar entre 0 e 10.");
    }
  }

  get getGrade2 => _grade2;

  set setGrade2(double grade) {
    if (grade >= 0 && grade <= 10) {
      _grade2 = grade;
    } else {
      throw ArgumentError("A nota 2 deve estar entre 0 e 10.");
    }
  }

  double calculateAverage() {
    return (_grade1 + _grade2) / 2;
  }

  String checkApproval() {
    if (calculateAverage() >= 7) {
      return "Approved";
    } else {
      return "Reproved";
    }
  }

  void displayDetails() {
    print(
      "Name: $name \nGrade 1: $_grade1 \nGrade 2: $_grade2 \nAverage: ${calculateAverage()} \nSituation: ${checkApproval()}",
    );
  }
}

class Product {
  late final String? name;
  late double _price;

  Product(this.name);

  set productPrice(double value) {
    _price = value;
  }

  Product.discount(String originalName, double originalPrice, double discount) {
    name = originalName;
    _price = originalPrice - originalPrice * (discount / 100);
  }

  void displayDate() {
    print("-" * 40);
    print("Product: $name \nPrice: ${_price.toStringAsFixed(2)}");
  }
}

class Employee {
  late final String? name;
  late double _salary;

  Employee(this.name);

  set addSalary(double value) {
    _salary = value;
  }

  get getSalary => _salary;

  void increaseSalary(double porcent) {
    addSalary = getSalary * (1 + porcent / 100);
  }

  void displayDate() {
    print("Employee: $name \nSalary: ${_salary.toStringAsFixed(2)}");
  }
}

class Cadaster {
  List<String> people = [];

  void addPeople(String p) {
    people.add(p);
  }

  void listPeople() {
    print(people);
  }
}
