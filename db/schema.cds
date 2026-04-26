using {cuid,managed} from '@sap/cds/common';

namespace BooksApp.db;

entity Books : cuid,managed{
    Title : String;
    Author : Association to Authors;
    Chapters : Composition of many Chapters on Chapters.Book = $self;
}

entity Authors : cuid,managed{
    Name : String;
    Books : Association to many Books on Books.Author = $self;
}

entity Chapters : cuid,managed{
    Number : Integer;
    key Book : Association to Books;
}