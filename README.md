# 📚 Library Management System

## 📌 Project Title
**Library Management System using MySQL**

## 📝 Description
This project is a fully-functional relational database designed to manage a library's operations, including:
- Tracking books, authors, and genres
- Managing members and book loans
- Handling multiple authors per book and multiple genres per book
- Tracking which members have borrowed which books and their return status

**Entity Relationships**
The following describes how each table is related:

Books ↔ Authors:
Many-to-Many
A book can have multiple authors, and an author can write multiple books.
Implemented via the BookAuthors junction table.

Books ↔ Categories:
Many-to-Many
A book can belong to multiple categories (e.g., Fiction, Fantasy), and a category can include multiple books.
Implemented via the BookCategories junction table.

Books ↔ Loans:
One-to-Many
One book can be loaned multiple times to different members.

Members ↔ Loans:
One-to-Many
One member can have multiple book loans.

Books ↔ Members (via Loans):
Many-to-Many (indirect)
Members borrow many books; each book can be borrowed by many members over time.

**How to Set Up / Run the Project**

1. **Clone this repository**
   ```bash
   git clone https://github.com/janeokumbe/library-management-system.git
   cd library-management-system

   ERD Screenshot
C:\Users\USERR\Desktop\library-management-system\erd.png

