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

Create the Event.Swift
1. Define some structs in this file. All key names must be the same as the JSON objects in the resource url
