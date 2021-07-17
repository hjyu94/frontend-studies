class Person {
  String name;
  int age;
  String sex;

  // named argument
  // optional
  Person({String name, int age, String sex}){
    this.name = name;
    this.age = age;
    this.sex = sex;
  }
}

void main() {
  Person p1 = new Person(age: 30);
}

/// Widget 의 argument 넣는 방식과 동일
/// 단 Widget 객체 생성은 new 키워드를 생략할 수 있다.