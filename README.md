# Blog App with Flutter

I'm developing a mobile app with Flutter for an Instagram account.
The app will initially be used to display categorized content.

Currently, there are features such as light-dark theme, text sharing, application sharing, write to us.
In the next updates, features such as liking and commenting will be added.

I used Cloud Firestore for database and Cloud Storage for Firebase for storage.

In order to reduce the server cost, the queries are displayed to the user with paging. To access data offline, data is saved on the device using Hive.

![g_AdobeExpress (1)](https://user-images.githubusercontent.com/55411723/194293712-b33d2116-5565-4de0-9644-2a90c9ce0b06.gif)

At the first startup, there is an introductory screen consisting of three screens, followed by the start screen.

![about1](https://user-images.githubusercontent.com/55411723/197778094-792f28d3-85bc-4eca-acad-17e72052f509.png)

There are two navigation bars, the homepage and the category. The content can be read from the detail page by clicking on the relevant content to be read. On the category page, curious content can be easily found.

![light1](https://user-images.githubusercontent.com/55411723/197777359-ed095bf9-258f-4e42-b19e-77eecf857161.png)

And dark theme.

![dark1](https://user-images.githubusercontent.com/55411723/197777341-e0702d67-31a8-425d-ade2-3978d26035fa.png)
