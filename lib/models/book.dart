

final bookData = [
  {
    'label': 'Chariots of Gods',
    'overview': 'Von Däniken also spends around one-third of the book discussing the possibility that humans could theoretically offer primitive civilizations on interstellar worlds advanced technology',
    'imageUrl': 'https://images-na.ssl-images-amazon.com/images/I/91-hB1680tL.jpg',
    'rating': '⭐⭐⭐⭐⭐',
    'genre': 'mystery'
  },
  {
    'label': 'To Kill a Mockingbird',
    'overview': 'Reaction to the novel varied widely upon publication. Despite the number of copies sold and its widespread use in education, literary analysis of it is sparse. Author Mary McDonough Murphy,',
    'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/800px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg',
    'rating': '⭐⭐⭐⭐',
    'genre': 'crime'
  },
  {
    'label': 'Secret Window',
    'overview': 'One day, a man named John Shooter arrives at the cabin and accuses Mort of plagiarizing his short story, "Sowing Season". Upon reading Shooter\'s manuscript, Mort discovers it is virtually identical to his own story, "Secret Window", except for the ending. The following day,',
    'imageUrl': 'https://upload.wikimedia.org/wikipedia/en/7/70/Secret_Window_movie.jpg',
    'rating': '⭐⭐⭐⭐⭐',
    'genre': 'thriller'
  },
];


final moreBookData = [
  {
    'label': 'Tenth of December',
    'overview': 'One of the most important and blazingly original writers of his generation, George Saunders is an undisputed master of the short story, and Tenth of December is his most honest, accessible, and moving collection yet.',
    'imageUrl': 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1349967540i/13641208.jpg',
    'rating': '⭐⭐⭐⭐',
    'genre': 'fiction'
  },
  {
    'label': 'The Illustrated Man',
    'overview': 'That The Illustrated Man has remained in print since being published in 1951 is fair testimony to the universal appeal of Ray Bradbury\'s work. Only his second collection (the first was Dark Carnival, later reworked into The October Country), it is a marvelous, if mostly dark, quilt of science fiction, fantasy, and horror.',
    'imageUrl': 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1374049820i/24830.jpg',
    'rating': '⭐⭐⭐⭐',
    'genre': 'crime'
  },
  {
    'label': 'The Monkey\'s Paw',
    'overview': 'One day, a man named John Shooter arrives at the cabin and accuses Mort of plagiarizing his short story, "Sowing Season". Upon reading Shooter\'s manuscript, Mort discovers it is virtually identical to his own story, "Secret Window", except for the ending. The following day,',
    'imageUrl': 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348984485i/8779896.jpg',
    'rating': '⭐⭐⭐⭐⭐',
    'genre': 'suspense'
  },

];

List<Book> books = bookData.map((e) => Book.fromJson(e)).toList();  //e is the individual map. it will call Book.fromJson and return list into books

List<Book> moreBook = moreBookData.map((e) => Book.from(e)).toList();

class Book {
  String label;
  String overview;
  String imageUrl;
  String rating;
  String genre;

  Book({required this.label, required this.overview, required this.imageUrl, required this.rating, required this.genre});

 factory Book.fromJson(Map<String, dynamic> json){
   return Book(
       label: json['label'],
       overview: json['overview'],
       imageUrl: json['imageUrl'],
       rating: json['rating'],
       genre: json['genre'],

   );
 }

 factory Book.from(Map<String, dynamic> json){
   return Book(label: json['label'],
     overview: json['overview'],
     imageUrl: json['imageUrl'],
     rating: json['rating'],
     genre: json['genre']);
 }


}