import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Book {
  String title;
  Book(this.title);
}

class Student {
  String name;
  List<Book> borrowedBooks;
  Student(this.name, [this.borrowedBooks = const []]);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Book> books = [Book("Sách 01"), Book("Sách 02")];

  List<Student> students = [
    Student("Huỳnh Trọng Phúc", [Book("Sách 01"), Book("Sách 02")]),
    Student("Lâm Thúy Ngọc ", [Book("Sách 01")]),
    Student("Tạ ĐỨc BẢo"),
  ];

  Student? selectedStudent;

  @override
  void initState() {
    super.initState();
    selectedStudent = students[0];
  }

  void selectStudent(Student student) {
    setState(() {
      selectedStudent = student;
    });
  }

  void toggleBorrow(Book book, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedStudent!.borrowedBooks.add(book);
      } else {
        selectedStudent!.borrowedBooks
            .removeWhere((b) => b.title == book.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      ManageScreen(
        students: students,
        books: books,
        selectedStudent: selectedStudent!,
        onSelectStudent: selectStudent,
        onToggleBorrow: toggleBorrow,
      ),
      BookListScreen(books: books),
      StudentListScreen(students: students),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'DS Sách'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Sinh viên'),
        ],
      ),
    );
  }
}

// --------- MANAGE SCREEN ---------
class ManageScreen extends StatelessWidget {
  final List<Student> students;
  final List<Book> books;
  final Student selectedStudent;
  final Function(Student) onSelectStudent;
  final Function(Book, bool) onToggleBorrow;

  ManageScreen({
    required this.students,
    required this.books,
    required this.selectedStudent,
    required this.onSelectStudent,
    required this.onToggleBorrow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hệ thống Quản lý Thư viện')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                  child: DropdownButton<Student>(
                    value: selectedStudent,
                    isExpanded: true,
                    onChanged: (Student? student) {
                      if (student != null) onSelectStudent(student);
                    },
                    items: students.map((student) {
                      return DropdownMenuItem<Student>(
                        value: student,
                        child: Text(student.name),
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Thay đổi')),
              ],
            ),
            SizedBox(height: 16),

  
            Text('Danh sách sách:', style: TextStyle(fontWeight: FontWeight.bold)),
            if (selectedStudent.borrowedBooks.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Bạn chưa mượn quyền sách nào.\nNhấn "Thêm" để hoàn thành bước chọn sách.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final isBorrowed = selectedStudent.borrowedBooks
                      .any((b) => b.title == book.title);
                  return CheckboxListTile(
                    title: Text(book.title),
                    value: isBorrowed,
                    onChanged: (value) {
                      onToggleBorrow(book, value ?? false);
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã lưu danh sách mượn sách')),
                );
              },
              child: Text('Thêm'),
            ),
          ],
        ),
      ),
    );
  }
}


class BookListScreen extends StatelessWidget {
  final List<Book> books;

  BookListScreen({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách Sách')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) =>
            ListTile(leading: Icon(Icons.book), title: Text(books[index].title)),
      ),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  final List<Student> students;

  StudentListScreen({required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách Sinh viên')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(student.name),
            subtitle: Text(
                'Mượn: ${student.borrowedBooks.map((b) => b.title).join(', ')}'),
          );
        },
      ),
    );
  }
}
