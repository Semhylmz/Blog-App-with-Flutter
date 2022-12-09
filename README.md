# Blog App with Flutter

I'm developing a mobile app with Flutter for an Instagram account. The application is being developed to display categorized content.

When the application is opened for the first time, information about the application is given. In subsequent startups, the user is greeted by the splash screen and then directed to the main screen.

I used Provider package for state management.

Internet connection status management was done by creating flow.

Posts are displayed to the user with pagination to reduce server cost.

I used Cloud Firestore for database and Cloud Storage for storage to quickly deliver the application to the end user.

Some features in the first version:

- Light/Dark theme.
- All or the copied part of the post on the desired platform sharing.
- The font can be enlarged or reduced with two fingers.
- The previous/next content can be accessed with the button before/after leaving the relevant category.
- The last access date to the post is recorded in the database with sqlite, and the user is informed about the last access time in the post.
- Adding a favorite post. With Sqflite, data is saved on the device to access favorite content offline.
- Watching video on YouTube from within the App with YouTube Data API v3.
- Sharing the downloadable link of the application.
- Forwarding to Instagram, WhatsApp, Gmail, YouTube account.

Application video:

https://drive.google.com/file/d/1PXRgx8dNRXCe2Smiwd58ENJ_M_f5cqA3/view?usp=sharing

In the first use, the information screen is followed by the start screen. And the about part.

![info](https://user-images.githubusercontent.com/55411723/206755832-4f2338cf-93d7-4b0b-8e2a-479f6646d2a6.png)

Light theme.

![light](https://user-images.githubusercontent.com/55411723/206753666-1d393d93-814b-4c0c-9b81-0b1295abd347.png)

And dark theme.

![dark](https://user-images.githubusercontent.com/55411723/206754427-bddcb6e8-d568-479d-bf57-d68ff2aab6e6.png)

The app is currently in the process of internal testing on the Google Play store.
