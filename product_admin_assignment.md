# Admin Product Management Assignment Specification

## Overview

This admin-only interface allows authorized users to perform full CRUD (Create, Read, Update, Delete) operations on products stored in the `Product` table of the `eCommerceDB` database.

## Product Table Structure

The interface supports editing the following fields in the `Product` table:

- `ProductID` (INT, PRIMARY KEY, AUTO_INCREMENT) - **Not editable**
- `Name` (VARCHAR(255)) - **Required**
- `Description` (TEXT) - **Optional**
- `Price` (DECIMAL(10,2)) - **Required**
- `Cost` (DECIMAL(10,2)) - **Required**

## Features

### 1. View All Products

- This is the default page behavior - implemented in index.html
- Displays all products in a table.
- Each row displays: `ProductID`, `Name`, `Price`, `Cost`, and a `Description`.
- Each row includes “Edit” and “Delete” buttons.

### 2. Add New Product

- A “Create New Product” button opens a form with the following fields:
  - `Name` (input text, required)
  - `Description` (multi-line textarea)
  - `Price` (decimal input, required)
  - `Cost` (decimal input, required)
- A “Save” button submits the form and inserts the product into the database.

### 3. Edit Product

- Clicking “Edit” on a product row opens a form pre-filled with the product’s current data.
- Editable fields: `Name`, `Description`, `Price`, `Cost`
- `ProductID` is displayed but not editable.
- “Save Changes” updates the record in the database.

### 4. Delete Product

- Clicking “Delete” prompts a confirmation dialog.
- If confirmed, deletes the product from the database.
- If the product is part of any existing orders, the product cannot be deleted.
- this implies that the product has a 'status' like active or inactive. (TODO)


### DB Assumptions

This page interacts with the following schema:

```sql
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Cost DECIMAL(10,2) NOT NULL
);

### Assignment Activities

Edit app.py to do the following things:

1. Fix the get_db_connection function to use YOUR username and password for your DB. Note that this is hardcoded in the app code and this is a very insecure practice. We're doing it this way to help you see how these things all interact. The proper way for a production application would be to use an external key store that encrypted the username and password and used a request to the keystore to go get it. 

2. Add an sql statement to the index() function that returns all the products in the product table. Do this on the line that says sql = "put your sql here"

3. Add an sql statement to the create() function that inserts the values that the user entered in the form. Again, just add your sql to the sql = "your sql here" line.

4. Add two sql statements to the edit() function. One to retrieve the values for the ID that was clicked on the Edit line in the form. Another that does an Update, including the changes that the user made.

5. Add an sql statement to the delete() function that Deletes the item that the user has specified.

6. Test your code - try each of the things to make sure your sql has functioned properly.

