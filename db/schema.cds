using {
    cuid,
    managed
} from '@sap/cds/common';

namespace BooksApp.db;

entity Books : cuid, managed {
    Title       : String;
    Author      : Association to Authors;
    Genre       : String;
    PublishedAt : Date;
    Page        : Integer;
    Stock       : Integer;
    Status      : Association to BookStatus;
    Price       : Decimal(9, 2);
    Chapters    : Composition of many Chapters
                      on Chapters.Book = $self;
}

entity BookStatus {
    key code        : String(1) enum {
            Available = 'A';
            Low_Stock = 'L';
            Unavailable = 'U';
        }
        criticality : Integer;
        displayText : String;
}

entity Authors : cuid, managed {
    Name  : String;
    Books : Association to many Books
                on Books.Author = $self;
}

entity Chapters : cuid, managed {
    key Book   : Association to Books;
        Number : Integer;
        Title  : String;
        Pages  : Integer;

}
