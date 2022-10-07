## Chuck Norris Application
Chuck Norris is a simple FLutter application developped for Android. The application consist of one HomePage page. The application has 2 basic functionalities, Showing jokes and Switching jokes. In this page, a tinder card is used to show one joke at a time. Inside card there is the category of the joke and the joke itself . In the bottom side of the card there is a button embeded to direct the user to WebPage of the joke.
### User Guide
When the application is opened for the first time, A joke is being presented. Swiping cards to left or right whill change the joke and show a new random joke. Also to see the webpage of the joke click on the button to redirect to WebPage. Although the application will not crash without connecting to internet (the exceptions are being handle using Null Safety feature),  an intrnet conncetion is required to exploit all features of application.
### Technical Guide
- ##### Networking: 
   Http protocol is used to carry out networking part of the application. There is only one endpoint in which Get method is being used to fetch the data. The respones that is being sent is in Json format. A serializer is being used to convert Json data into Dart. The Json Object has 7 properties from which only 4 is being used in our application. So the serializer extract only 4 properties. These four properties are as followed: "categories", "value", "url" and "id". ***category*** property is the list of a list of categories(string) of the joke. Most of the times its is an empty list. In this case  we return **undefined** as the category. ***value*** is a sting that contains the joke itself. ***url*** is property that have the url to the **Web page** of the current joke. ***id*** is the property which is not being used in UI directly, instead, it is being used to check if a new joke have been fetched or not, and while waiting for ***get request*** to get response, the application shows ***CircularProgressIndicator***. 

- ##### Code:
The whole application is consist of are 3 ***.dart*** files. the purpose of separating code to 3 different files is to make the code more clean and abstract for the sake of understaing . ***main..dart*** is responsible for the Ui of the application. The Card.dart is contains classes (Widgets) and methods related to Tinder card and also footer of the application. The ***Get_Class.dart*** file contains the Serializer model which is being used to fetch the data from given API.

**Click** [HERE](https://drive.google.com/file/d/1zeZlNtD-0LNcX-kKYBZgdyGS_sywgDYO/view?usp=sharing) **for APK**.


"category" (1) , "value"(2) and "url"(3) fields are refered in UI respectively as it shown in figure below:

![Application](assets/img1.png)

Pressing button will lunch a the url and redirect to WebPage that contains the Joke(1) shown in figure below:

![Website](assets/img2.png)

- ##### Advanced
if a joke value is too long, ***SingleChildScrollView*** widget is used to make the home page scrolable. Also ***SwipeTo*** widget is used to add Swiping feature to the app. Swiping to right or left will make an action and by calling **setState()** a new joke card will be retrieved.


