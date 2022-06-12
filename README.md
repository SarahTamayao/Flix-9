# Project 2 - *Flix*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **25** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User sees an app icon on the home screen and a styled launch screen.
- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.
- [X] User sees an error message when there's a networking error.
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [X] User can tap a poster in the collection view to see a detail screen of that movie
- [X] User can search for a movie.
- [ ] All images fade in as they are loading. **(attempted this but could not verify whether it worked due to cache clearing issues)**
- [X] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [X] Customize the selection effect of the cell. **(set it to none to remove the persistent highlighting even after selection)**
- [X] Customize the navigation bar.
- [X] Customize the UI.
- [X] Run your app on a real device.

The following **additional** features are implemented:

- [X] User can watch the movie trailer by tapping on the backdrop image or the "watch trailer" button
- [X] Added a settings tab to the tab bar 
- [X] User can toggle between dark mode and light mode
- [X] User can choose between 5 different nav/tab bar colors (and one default color) 
- [X] Rating and release date information provided on the detail screen of the collection view

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would love to discuss more about filtering, searching, and sorting. I think this would be a powerful way to enhance the app (especially if there's lots of movies)!
2. I would also like to discuss more about UI Design -- I'm not the best designer out there, and it would always be helpful to get more opinions on layouts and customizations.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src="flix_demo.gif">

GIF created with [Kap](https://getkap.co/).

## Notes

One of the most challenging parts for me was implementing the search function. I had a bit of trouble figuring out how to search an object, but it was a great learning experience! Other challenging parts included loading the movie trailer and making UI design choices.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [2021] [Sabrina Meng]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
