# Waitr

Created by [Susie O'Brien](https://github.com/susancal), [Mark Cassidy](https://github.com/mcassid3), [Kyriakos Kalpakidis](https://github.com/kjkalpa), and [Stephano Hong](https://github.com/stephanoH).

Waitr is a mobile web app created to cure the boredom experienced by waiting parties at restaurants all across the world. Featuring live-updating wait times and some friendly head-to-head competition, Waitr adds a little fun to your wait time to make it fly by.

## How To Use
There are two interfaces we created: one for restaurants, and one for waiting parties. We have created a "demo version" of our app to make available to the public. Some features have been removed for this demo version that will be noted in the instructions below.

### Restaurant Interface (Best viewed on iPad or monitor)
* [Visit Waitr Restaurant View on Heroku](http://waitr-app.herokuapp.com)
* Login as "DemoRestaurant" and "password"
* You will see your restaurant's current waiting list with the option to add a party or change the current promotion. The first two parties have been hardcoded to the list, but feel free to add a party. 
* (This feature has been removed) When a party is added to the list, a text will be sent to their provided phone number with a custom link that they use to view their party interface. Visit app/controllers/parties_controller.rb on Github to view the commented code for this feature.
* Restaurants have the option to add or change the current "promotion" and points needed. Parties will have the option to play trivia for points to win these promotions.

### Patron/Party Interface (Best viewed on mobile)
* When a party is added to the waiting list, they will receive [a text message](http://i.imgur.com/Puv06sb.jpg) from our app with a link to their custom URL.
* [Visit Waitr Party View on Heroku](http://waitr-app.herokuapp.com/restaurants/1/parties/098765)
* You will see the number of parties ahead of you on the waiting list, an option to play live head-to-head trivia, and an option to view your restaurant's leaderboard.
If you want to see the trivia in action, open another incognito browser window and [view this party's page](http://waitr-app.herokuapp.com/restaurants/1/parties/123456). Click play on each page!

## Technologies Used
* Ruby on Rails 5
* jQuery
* JavaScript
* AJAX polling
* Action Cable
* React
* D3
* Twilio API
* Materialize