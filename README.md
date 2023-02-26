# Blog App with Flutter

I'm developing a mobile app with Flutter for an organization. The application is developed for users to view categorized content.

When the application is opened for the first time, information about the application is given. In subsequent startups, the user is greeted with the splash screen and 
then directed to the main screen.

Editor's picks and video of the week are updated every Friday by checking the database.
I used Provider package for state management.
Internet connection status management was done by creating flow.
Posts are displayed to the user with pagination to reduce server cost.

I used Cloud Firestore for database and Cloud Storage for storage.

Features such as sending notifications and commenting on content will be added with updates.

## Some features in the first version:

* Light/Dark theme.
* Notification sending with FCM and weekly scheduled notifications.
* All or the copied part of the post on the desired platform sharing.
* The font can be enlarged or reduced with two fingers.
* The previous/next content can be accessed with the button before/after leaving the relevant category.
* The last access date to the post is recorded in the database with sqlite, and the user is informed about the last access time in the post.
* Adding seven editor selected weekly content and favorite posts. With sqflite, data is saved on the device for offline access to favorite content and editörs pick.
* Watching video on YouTube from within the App with YouTube Data API v3.
* Sharing the downloadable link of the application.
* Forwarding to Instagram, WhatsApp, Gmail, YouTube apps.
* Double click like/unlike.
* Long click sharing.

## You can get the application from the Play Store
<a href="https://play.google.com/store/apps/details?id=com.ateizmfikrinecevaplar">
<img src="https://user-images.githubusercontent.com/55411723/221411976-332c7877-2b9c-45de-b7c4-854916be2fdd.png" witdh="40" height="120"><a/>

## Application video
<a href="https://www.youtube.com/watch?v=3Ae_veDsGwY">
<img src="https://user-images.githubusercontent.com/55411723/221413219-0eb54050-c390-4cbe-b9b7-ebde2c0515fc.png" witdh="240" height="120"><a/>


> In the first use, the information screen is followed by the start screen. And the about part.

![206755832-4f2338cf-93d7-4b0b-8e2a-479f6646d2a6](https://user-images.githubusercontent.com/55411723/221414286-34d788d7-ad74-4b72-93dd-1ff56b9e103d.png)

> Light theme.

![206753666-1d393d93-814b-4c0c-9b81-0b1295abd347](https://user-images.githubusercontent.com/55411723/221414292-519f38da-a13f-4cdb-a4e9-73275c3a2519.png)

> And dark theme.
![206754427-bddcb6e8-d568-479d-bf57-d68ff2aab6e6](https://user-images.githubusercontent.com/55411723/221414300-63d1d323-9f76-42a3-9f0b-0037a78417c9.png)
