# FetchEvents

**Building in progress**

This is my starter project after learning Swift over the weekend. I am still in the process of building this mini App and try to connect it with the SeatGeek Platform API.

About this project:
- It supports iOS 12 and above
- It complies with Xcode 12

Run the partially done application:
- Clone this project 
- Open the project with Xcode
- Select a device and click the run button

How I built this project:

Get the SeetGeek client id, replace MYCLIENTID with your client id for the resource URL:
https://api.seatgeek.com/2/events?client_id=MYCLIENTID

Main.storyboard
1. Find "Navigation Controller Scene" from the "+" icon (UI library), drag it to the canvas
2. Find the "Table View" from the UI library and drag it to the canvas
3. Find the "Search Bar" from the UI library and drag it on the very top of table view

Create a Swift file for some structs
1. All key names must be the same as the JSON objects in the resource url
2. Must decode each struct

Create a Swift file for the table view controller and related functions
1. Search bar delegates goes here
2. Use the functions for rendering data to the table view.

Create a Swift file for API request
1. Put the resource URL here
2. Send GET request to the API and parse return data to JSON objects.

**Challenges that I faced*
The Swift language is fairly easy, but its library / UI codes are little complicated to me compared to React Native, because I've learned how to use in only a few days. I was having difficulties trying fetching data from the events array, and for some reason, it returned an empty array. I guess it has something to do with the life cycle, or I didn't define the structs correctly. But overall it's a great experience, and I will keep looking for a solution to solve this problem and finish this project.
