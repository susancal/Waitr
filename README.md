# Waitr

Created by [Susie O'Brien](https://github.com/susancal), [Mark Cassidy](https://github.com/mcassid3), [Kyriakos Kalpakidis](https://github.com/kjkalpa), and [Stephano Hong](https://github.com/stephanoH).

Waitr is a mobile web app created to cure the boredom experienced by waiting parties at restaurants all across the world. Featuring live-updating wait times and some friendly head-to-head competition, Waitr adds a little fun to your wait time to make it fly by.

## How To Use
There are two interfaces we created: one for restaurants, and one for waiting parties. We have created a "demo version" of our app to make available to the public. Some features have been removed for this demo version that will be noted in the instructions below.

### Restaurant Interface (Best viewed on iPad or monitor)
* [Visit Waitr on Heroku](http://waitr-app.herokuapp.com)
* Login as "DemoRestaurant" and "password"
* You will see your restaurant's current waiting list with the option to add a party or change the current promotion. The first two parties have been hardcoded to the list, but feel free to add a party. 
* (This feature has been removed) When a party is added to the list, a text will be sent to their provided phone number with a custom link that they use to view their party interface. Visit app/controllers/parties_controller.rb on Github to view the commented code for this feature.
* Restaurants have the option to add or change the current "promotion" and points needed. Parties will have the option to play trivia for points to win these promotions.

### Patron/Party Interface (Best viewed on mobile)
* When a party is added to the waiting list, they will receive a text message from our app with a link to their custom URL. [View screenshot]()
* [Visit Party Page on Heroku](waitr-app.herokuapp.com/restaurants/1/party/123456)