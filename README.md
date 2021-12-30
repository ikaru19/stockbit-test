# Stockbit Test

In this project I'm using the MVVM and Clean Architecture to help to easier to read the project structure and debug. The Depedency Injection to make the application easier to scaling. Also using the Reactive Programming to make application faster and lighter to hold data from Remote.  
_________________
## TopList
![Top List View](https://i.imgur.com/OKBuoMr.png)
In this view, I'm using custom table cell view contains 4 UILabel to hold the Data from the Remote Data. The Label itself calling API Key the Name, FullName, Price, CHANGEPCT24HOUR and CHANGE24HOUR. In order to mantain the scrolling performance i'm using the `dequeueReusableCell`. In order to handle error I'm using relay observable so whenever there is Error the view will got notice.
_________________
## News
![News View](https://i.imgur.com/WNxrO2p.png)
In this view, I'm using custom table cell view contains 3 UILabel to hold the Data from the Remote Data. The Label itself calling the Name, Source and Title of a News. In order to mantain the scrolling performance i'm using the `dequeueReusableCell`. In order to handle error I'm using relay observable so whenever there is Error the view will got notice. Because there is no loading in here, I maintain the performance using the Reactive and Observable so it will show the news faster
