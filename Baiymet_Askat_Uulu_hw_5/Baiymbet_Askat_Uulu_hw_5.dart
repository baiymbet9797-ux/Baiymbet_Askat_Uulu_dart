import 'book.dart';

void main() {
  Library cityLib = Library('City Library');
  Book book1 = Book('Harry Potter', 'J.K. Rowling');
  Book book2 = Book.withRating('Don Quixote', 'Miguel de Cervantes', 7.8);
  Book book3 = Book('War and Peace', 'Leo Tolstoy');
  book3.setBook(8.2);
  cityLib.addBooks(book1);
  cityLib.addBooks(book2);
  cityLib.addBooks(book3);
  cityLib.showBooks();
  
}
