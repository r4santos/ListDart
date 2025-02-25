class People {
  final String name;
  late int _age;

  People(this.name);

  void setAge(int age) {
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

  Car(this.brand, this.model, double price) {
    setPrice(price);
  }

  void setPrice(double newPrice) {
    if (newPrice >= 0) {
      _price = newPrice;
    } else {
      print("Erro: O preço não pode ser negativo.");
    }
  }

  double getPrice() => _price;

  void displayDate() {
    print("Brand: $brand \nModel: $model \nPrice: $_price");
  }
}

class BackAccount {
  final String holder;
  late double _balance;

  BackAccount(this.holder, double balance) {
    setBalance(balance);
  }

  void setBalance(double balance) {
    _balance = balance;
  }

  double getBalance() => _balance;

  void deposit(double value) {
    _balance = _balance + value;
  }

  void withDraw(double value) {
    _balance = _balance - value;
  }

  void displayDetails() {
    print("Holder Account: $holder \nBalance: $_balance");
  }
}

class Student {
  final String name;
  late double _grade1;
  late double _grade2;

  Student(this.name, double grade1, double grade2) {
    setGrade1(grade1);
    setGrade2(grade2);
  }

  double getGrade1() => _grade1;

  void setGrade1(double grade) {
    if (grade >= 0 && grade <= 10) {
      _grade1 = grade;
    } else {
      throw ArgumentError("A nota 1 deve estar entre 0 e 10.");
    }
  }

  double getGrade2() => _grade2;
  void setGrade2(double grade) {
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

void main() {
  People p1 = People("Sandro");
  p1.setAge(17);
  p1.displayDate();

  Car c1 = Car("Ford", "Crown", 35000);
  print(" ");
  Car c2 = Car("Toyota", "Corolla", 150000);

  print("\nCar details: ");
  c1.displayDate();
  print(" ");
  c2.displayDate();

  print("\nChanging prices:");
  c1.setPrice(45000);
  c2.setPrice(135000);

  c1.displayDate();
  print(" ");
  c2.displayDate();
  print(" ");

  BackAccount b1 = BackAccount("Anne", 2040);
  b1.displayDetails();
  print(" ");
  b1.deposit(100000);
  b1.displayDetails();
  print(" ");
  b1.withDraw(2040);
  b1.displayDetails();


  Student s1 = Student("João", 6, 3);
  print(" ");
  s1.displayDetails();

  print(" ");
  s1.setGrade1(7);
  s1.setGrade2(7.5);
  s1.displayDetails();
}