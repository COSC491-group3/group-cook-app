# UberCooks *probably will have to change name * 
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
1. [Schema](#Schema)

## Overview
### Description
**UberCooks** is an app that allows personal chefs that do not own resturants to still be able to sell food to customers with the same type of platform like UberEats or Doordash.
### App Evaluation
- **Category:** Food
- **Mobile:** This app would be primarily developed for mobile.
- **Story:** Allows users to order food from individuals instead of restaurants 
- **Market:** Individuals over 13 would be able to order from the app
- **Habit:** This app could be used as often or unoften as the user wanted depending on how much they want to order food
- **Scope:** First we would start with people who are within 5-10 mile radius and then we can expand!

## Product Spec

### Required Must Have Stories
[X] Login/Signup - different for the customer and the chef
    * customer sign up: name, age, email, phone number, address
    * chef: name, age, email, phone number, place of business, create their menu
[X] A Map feature that allows users to see their location
* User can view different chefs and what their menu offers
* User can select their favorite chefs
* User can order food, select and deselect items, create a payment method
* Chef should be able to toggle certain criteria/tags
    * food, delivery (pick up or drop off), money rating, we will think of some as we go, a star rating for each menu item
* User can track their ordered items
    * ex: They can get a notification saying that the chef sees their order, it's being prepared, it is available to either a) delievered or b) be picked up at the desired location
* Search filter 
    * Can include mile radius, location, food type
* User/Chef Profile [database] 
    * Save payment, past orders, any other info they want they want to include
    * Chef should be able to edit their menu

**Optional Nice to Have Features**

* A map feature in order to track food/delivery
* Rewards system, based on how many orders the can have a food coupon
### 2. Screen Archetypes

* Login 
* Register - User signs up or logs into their account
   * Can Register as a user or a cheg 
* Home Screen - Can see all the chefs in your area
* Search Screen 
   * Allows user to search and filter chefs
* Past Orders
   * Allows user to see the past orders.
* Profile Screen
   * Lets people see their favorites and their profile details

**Tab Navigation** (Tab to Screen)

* Home
* Search
* Past Orders
* Profile

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* The home pages will be different for customer/chef
* Ordering food page
* Once food is ordered, they can go to past orders, it will be listed and they can track it

### 3. Wireframes

<img src="https://i.imgur.com/zYlXixC.png" height = 500>
<img src="https://i.imgur.com/1Qi0MqK.png" height = 500>
<img src="https://i.imgur.com/TW7C17u.png" height = 500>
<img src="https://i.imgur.com/80SdqOr.png" height = 500>
<img src="https://i.imgur.com/AoXJudp.png" height = 500>
<img src="https://i.imgur.com/cS8WG0y.png" height = 500>

### 4. Schema

**Menu Item**
| Type | Property  | Description  |
| :-----: | :-: | :-: |
| Pointer | chef | Points to the chef's specific menu |
| String  | fooditem | food item |
| Int | quantity | how many user chooses |
| Bool | favoriteItem | If its a favorite item on the chef's menu |

## Networking
* Menu Screen
   * (Read/Get) Query all menu items
   ```
   let query = PFQuery(className:"MENU")
   query.whereKey("author", equalTo: currentChef)
   query.findObjectsInBackground { (menuItems: [PFObject]?, error: Error?) in
      if let error = error { 
         print(error.localizedDescription)
      } else if let menuItems = menuItems {
         print("Successfully retrieved \(menu.count) posts.")
      }
   }
   ```
   * (Create/Delete) Items in user's cart
   * (Create/Delete) Chef's menu items
   * (Update/ Put) When user's paid food items are recieved, being made, and when they are available for pick up

## Updates

Here is a walkthrough of what we have so far
<img src='http://g.recordit.co/F3HCbLVfZK.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

