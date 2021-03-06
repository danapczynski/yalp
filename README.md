## Yelp

This is a Yelp search app using the [Yelp API](http://developer.rottentomatoes.com/docs/read/JSON).

Time spent: `15 hours`

### Features

#### Required

- [X] Search results page
   - [X] Table rows should be dynamic height according to the content height
   - [X] Custom cells should have the proper Auto Layout constraints
   - [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
- [X] Filter page. Unfortunately, not all the filters are supported in the Yelp API.
   - [X] The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
   - [X] The filters table should be organized into sections as in the mock. **I went with a button implementation instead.**
   - [ ] You can use the default UISwitch for on/off states. Optional: implement a custom switch
   - [ ] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings. **(I decided I didn't like this.)**
   - [X] Display some of the available Yelp categories (choose any 3-4 that you want).

** Sort and Deals filters have not yet been implemented--I ran out of time. :/**

#### Optional

- [ ] Search results page
   - [ ] Infinite scroll for restaurant results
   - [ ] Implement map view of restaurant results
- [ ] Filter page
   - [ ] Radius filter should expand as in the real Yelp app
   - [ ] Categories should show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
- [ ] Implement the restaurant detail page.

### Walkthrough

![Video Walkthrough](https://raw.githubusercontent.com/danapczynski/yalp/master/yalp_walkthrough.gif)

