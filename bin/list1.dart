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
        break;
      case "3":
        stdout.write("Hi! Enter your name and create your \nnew account: ");
        String? name = stdin.readLineSync();
        BackAccount b = BackAccount(name!);
        stdout.write("Enter your current balance: ");
        String? balance = stdin.readLineSync();
        if (balance != null) {
          try {
            double valueBalance = double.parse(balance);
            b.deposit(valueBalance);

            print("-" * 40);
            print("Welcome Sr.(a) $name");

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
        break;
      case "4":
        break;
      case "5":
        break;
      case "6":
        break;
      case "7":
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
    print("Brand: $brand \nModel: $model \nPrice: $_price");
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
    if (value > getBalance) {
      setBalance = getBalance - value;
    } else {
      print("The desired amount is greater than \nthe available balance");
    }
  }

  void displayDetails() {
    print("Holder Account: $holder \nBalance: $_balance");
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
      return "Aprovado";
    } else {
      return "Reprovado";
    }
  }

  void displayDetails() {
    print(
      "Name: $name \nGrade 1: $_grade1 \nGrade 2: $_grade2 \nAverage: ${calculateAverage()} \nSituation: ${checkApproval()}",
    );
  }
}
