# eCommerce Database Project - IT2300
---
### This project is designed to help students learn how to integrate database queries with a simple web backend. It is completely open source, free to use and free to modify and distribute. No warranty whatsoever. Enjoy!
---
### Contents:
1. eCommerceDB.drawio - an Entity Relationship Diagram (editable in draw.io)
2. eCommerceDB.png - a picture of the ER diagram
3. eCommerceDB.sql - a script containing the sql to create the database and the tables
4. eCommerceSpec.md - a simple specification for the project
5. manage_products - a flask app that lets you administer CRUD operations on the product table. Assumes the DB has been created and mysql is running. Depends on flask and mysql-connector-python
6. product_admin_assignment.md - an assignment allowing students to connect the app to their database and add sql to do the CRUD operations on the product table. Uses the manage_products app.
   
---
### Important

1. This project assumes you have already installed mysql and can use the mysql command line tool.
2. To run the database creation script, you can execute 
    mysql -u root -p < eCommerceDB.sql
3. You can run this as often as you like to clear the data from the database and start fresh. 
4. Be sure that the manage_products app is NOT running when you do this. 
5. draw.io is a web based drawing tool that you can access by simply typing draw.io in the browser URL line.
6. There are some important constraints and quirks in the database and the manage_projects app 
    - the Order table has to be accessed with `Order` because Order is a mysql reserved word. This is on purpose so you can learn how to do that.
    - Order_Product is how you add items to an order. There is no constraint that an Order_Product row exists in an Order, in fact, you have to create the Order FIRST then create the Order_Product rows. 
    - When you delete an item from the Product table - it will work as long as that product is not included in any Orders. The delete link in the manage_products app works instantly with no 'are you sure?' warning. This is on purpose - that other code clutters the solution. You can add that if you like...
7. The database has all fields set to NOT NULL - this should make it easier for students to do joins, but it also means that there are things like "street2" that will be blank or have spaces in there. This is fine, but you should try to be consistent.
