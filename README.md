## Name
 naganotkhs

## Overview
 This app is an EC site for Nagano cake which sells cakes for over 45 years in Nagano prefecture in Japan.

## Usage and Functions

### end users
- You can sign up, log in/out with email addres and passwords, and also close an account.
- You can see products without log in.
- You can add multiple products to a cart, change the qty, and delte them from the cart.
- Products are sorted by popularity.
- User information can be edited.
- Order history shows the following information.
   - Order date
   - Order details
   - Total price
   - Sending address
   - Status(Waiting for payment/Waiting for shipping/Shipped)
- Following information is registered when end users sign up
   - User name (Given name/Family name)
     -Basically, Written by Kanji and Katakana in Japan.
   - Zipcode
   - Adress
   -Phone number
   -Mail address
   -Pass words
- You can search products from search bar at the top.(Partial match)
- 
### Admin
- You can log in/out with email address and password.
- You can add/edit products, genres.
- Products have following information.
    - Name
    - Description
    - Genre
    - Price (Non-taxed)
    - Image
    - Selling status(on sale/sold out)

- You can edit info of end users including closing accouunt.
- You can see orders and order details.
- Order details have following informaiton.
   - Buyer
   - Order date
   - Order details
   - Total price
   - Shipping address
   - Order status(Waiting for payment/paid/Shipped)
   - Production status(Waiting for producing/Producing/Production completed)
   - You can update Order and production stutas.
   - You can search earnings. (eg.compared to the last day.)

## Languages
- HTML&CSS
- Ruby (2.5.7)
- Javascript

## frame work
- Ruby on rails (5.2.4.1)

## Gem
- kaminari
- refile
- refile-mini-magick
- bootstrap-saas
- devise
- pry-byebug
- jquery-rails

## Author

[tkhs](https://github.com/ptkhs)
