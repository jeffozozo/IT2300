from flask import Flask, render_template, request, redirect
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="dev",  # or 'root', depending on your setup
        password="dev",
        database="eCommerceDB"
    )


# default route - show the list of products
# note - products is a python dictionary that gets the results of the query
# products then becomes 'available' in the templates. {% for product in products %}

@app.route('/')
def index():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Product")
    products = cursor.fetchall()
    cursor.close()
    db.close()
    return render_template('index.html', products=products)


# handle a create request
# note - the form is filled out by the user in the html
# the field names in the form are in the ['name'] things. Look at the html to see the match...
@app.route('/create', methods=['GET', 'POST'])
def create():
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']
        cost = request.form['cost']
        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute(
            "INSERT INTO Product (Name, Description, Price, Cost) VALUES (%s, %s, %s, %s)",
            (name, description, price, cost)
        )
        db.commit()
        cursor.close()
        db.close()
        return redirect('/')
    return render_template('create.html')


# handle an edit request
@app.route('/edit/<int:product_id>', methods=['GET', 'POST'])
def edit(product_id):
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']
        cost = request.form['cost']
        cursor.execute(
            "UPDATE Product SET Name = %s, Description = %s, Price = %s, Cost = %s WHERE ProductID = %s",
            (name, description, price, cost, product_id)
        )
        db.commit()
        cursor.close()
        db.close()
        return redirect('/')
    cursor.execute("SELECT * FROM Product WHERE ProductID = %s", (product_id,))
    product = cursor.fetchone()
    cursor.close()
    db.close()
    return render_template('edit.html', product=product)

# handle a delete request
@app.route('/delete/<int:product_id>')
def delete(product_id):
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute("DELETE FROM Product WHERE ProductID = %s", (product_id,))
    db.commit()
    cursor.close()
    db.close()
    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True, port=5001)
