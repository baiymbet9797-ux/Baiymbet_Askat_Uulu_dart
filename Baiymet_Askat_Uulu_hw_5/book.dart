class Book {
  String? _title;
  String? _author;
  double? _rating;

  Book(this._title, this._author);
  Book.withRating(this._title, this._author, this._rating);

  void setBook(double rating) {
    if (rating < 0 || rating > 10) {
      print('The rating must be between 0 and 10.');
    } else {
      _rating = rating;
    }
  }

  String? get title => _title;
  String? get author => _author;
  double? get rating => _rating;

  void displayInfo() {
    print('Title:$_title');
    print('Author: $_author');
    print('Rating: $_rating');
  }
}

class Library {
  String name;
  Library(this.name);
  List<Book> _books = [];
  void addBooks(Book book) {
    _books.add(book);
  }

  void showBooks() {
    print('Library: $name');
    print('Books list:');

    for (int i = 0; i < _books.length; i++) {
      print('${i + 1}.${_books[i].title}');
    }
    print('Total books in library: ${_books.length}');
  }
}
