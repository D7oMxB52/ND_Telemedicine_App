# ND_Telemedicine_App
## TEAM NAME  
G12 Bin Chickens
## TEAM MEMBERS  
Luke Mullan | s3284243@student.rmit.edu.au  
Amy Miniter | s3755304@student.rmit.edu.au  
Syed Ali | s3736294@student.rmit.edu.au  
Abdulrahman Ahmed Alanazi | s3813024@student.rmit.edu.au  
Joseph Jermaine Jamisola | s3869992@student.rmit.edu.au  
## LINKS
Issue Tracker Board (Jira)  
https://cosc2299-team12.atlassian.net/jira/software/projects/T12/boards/1  
			
Communication Tool (MS Teams)  
https://teams.microsoft.com/l/team/19%3aMiDhTm-ttfurDtEu_H7EzGYGFU7z-thcU4w2XSH5BS41%40thread.tacv2/conversations?groupId=d6fef109-f2c9-4cd9-a968-dbb4320410c0&tenantId=d1323671-cdbe-4417-b4d4-bdb24b51316b  

## How to build, deploy and run the application

### Backend:

In the backend, there are multiple module maven projects - Booking and Nd_Telemedicine_App.
To build the application, open the `maven` tab on the right side of the screen in IntelliJ. You can clean, compile and deploy the whole project by clicking on the `Lifecycle` build foler and then click on clean, compile and deploy, and click on the green play button to run the task in each of them.
Similarly, to build and deploy the modules, go to the `booking` and `Nd_Telemedicine_App`, then open Lifecycle build folder and run clean, compile and deploy.

We are using the MySql database for this application and we have it set up in the local machines. To run on your machine, you need to go to `booking/src/main/resources/application.properties` and change the username and password according to your mysql server. The similar changes you need to make in the `nd_telemedicine_app/src/main/resources/application.properties` files. Once you make these changes, you need to create a database in your MySQL workbench named as `userServices`.

To run the application, you need to select the modules from the top in a dropdown list beside the run button. It would be `BookingApplication` and `NdTelemedicineAppApplication`, you will need to run both of the them.

### Frontend:

We are using flutter for the frontend. To get it working, you need to follow the steps below:

Install flutter
https://docs.flutter.dev/get-started/install

Install android studio
https://developer.android.com/studio/install

- IntelliJ IDEA -> File -> Settings -> Plugin

- Search 'Flutter'

- Install Flutter

- Search 'Dart'

- Install Dart

- Restart IDE

- Add Android SDK

- Tools -> Android -> AVD Manager

Once you do this, you will need to run two commands:

`flutter pub get`

and then 

`flutter run`

This will firstly make sure flutter all the packages needed are included then starts the app.


NOTE: _*Please make sure to use version 11 of java JDK*_
