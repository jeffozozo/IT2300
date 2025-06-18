# E-Commerce Site Specification

## Overview

This web application allows users to browse products, manage a cart, create accounts, sign in, and place orders. Users may shop anonymously until checkout, at which point they must sign in or register. The application will not handle payment processing directly but assumes integration with a third-party processor.

## User Flow Summary

- Anonymous browsing and cart usage is allowed
- Checkout requires sign-in or account creation
- Orders are saved to the database upon submission
- Past orders can be viewed in a user's order history

## Pages & Functionality

### 1. Create/Edit Account Page

- Allows a user to register with a username, password, first name, last name, email, and optional shipping/billing addresses.
- Allows signed-in users to update account details.

### 2. Sign In Page

- Can be accessed as a pop-up via a menu link.
- Authenticates users using `Username` and hashed `Password`.
- On success, grants access to checkout and order history.

### 3. Browse Products Page

- Includes a search bar to query the product catalog.
- Results appear as product cards, each displaying:
  - Product name
  - Description
  - Price
  - Quantity input box
  - “Add to Cart” button

### 4. Cart Page

- Accessed via cart icon in the top menu.
- Displays current cart contents:
  - Product name
  - Quantity
  - Price per item
  - Line total (price × quantity)
  - Overall cart total
- Contains a “Checkout” button.

### 5. Checkout Page

- If not signed in, prompts user to sign in or create an account.
- Displays shipping and billing info if available.
- Shows cart summary and a “Submit Order” button.

### 6. Order Complete Pop-Up

- Triggered upon successful checkout.
- Displays:
  - “Thank you for your order.”
  - Order summary (order ID, product names, quantities, prices, total)

### 7. Order History Page

- Accessible only after sign-in.
- Allows filtering by date range.
- Displays a list of past orders:
  - Top-level line: order ID, date
  - Indented line(s): product names
- Clicking on an order ID opens the Order Complete view again with full details.

## Account Behavior

- Cart contents are tracked per session unless the user is signed in.
- After sign-in, cart data can be persisted or merged with session data if implemented.

## Payments

- Checkout assumes payment is processed externally.
- No credit card info is collected or stored.
