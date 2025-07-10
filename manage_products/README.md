### GUI for Editing Products in the Product Table
This simple application allows you to edit the items in the product table. It assumes the product table exists and follows the format:


    - ProductID INT AUTO_INCREMENT PRIMARY KEY
    - Name VARCHAR(255) NOT NULL
    - Description TEXT
    - Price DECIMAL(10,2) NOT NULL
    - Cost DECIMAL(10,2) NOT NULL


It is a simple flask app with very bare-bones html templates. This is so that students can see exactly what is going on with the app code and with the templates. 

The purpose of the app is to show where the SQL plugs in, and how the built-in flask code uses the sql and query results to  populate regular python constructs (like dictionaries) so that the data can easily be used within the application. 

***

The state of the manage_products app is complete - meaning that it is usable in it's current form to edit the product table. To put the app into a state where the students have to fill in the sql, instructors will need to look in app.y and remove the various sql statements from the lines that say: 

sql = "some sql here"

It might seem like a trivial exercise to insert your sql in that spot, but you can have lots of conversation (including about things like sql injection). It's also critical to see that there is a 'cursor' that gets the results, and that there is a db.commit() when a change gets made. 



