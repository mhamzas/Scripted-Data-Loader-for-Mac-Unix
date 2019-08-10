Scripted Data Loader for Mac-Unix
==========

Force.com Apex Data Loader for Linux/Mac - command line version

This project provides the missing configuration and scripts for running the Apex Data Loader from Linux or Mac command line. The Apex Data Loader provided by Salesforce.com is for Windows only but it is a Java jar file that can be run on any platform that supports a JDK. The scripts are solely for executing the data loader from a command line and do not provide the GUI that is available in the Windows and the open source Mac versions. 

The open source version of dataloader is available from: https://github.com/forcedotcom/dataloader

##Requirements: 

1. Java SE >=11, available in the PATH (https://www.oracle.com/technetwork/java/javase/downloads/index.html)

2. DataLoader JAR file from Windows or built from the open source project [If changed]. 
(The current name/version of the jar file is: dataloader-46.0.0-uber.jar [included])

##Steps: 

1. Clone this project 
  ```
  $ git clone https://github.com/mhamzas/Scripted-Data-Loader-for-Mac-Unix.git
  ```
2. Copy the dataloader-46.0.0-uber.jar file to dataloader/ directory [If Changed, Edit encrypt and process and rename the file].
3. Generate the private key to encrypt the password
  ```
  $ bin/encrypt.sh -k <path to private.key file (ex. conf/>private.key)>
  ```
4. Encrypt the salesforce password (+security token, if required) using the generated private key
  ```
  $ bin/encrypt.sh -e "password+security token" conf/private.key
  ```
5. Copy the output from Step 4 above to the conf/config.properties file for the sfdc.password token 
6. Update the conf/config.properties file with sfdc.username and sfdc.endpoint token values
7. Optionally, adjust any other parameters in the conf/config.properties file
8. Run the sample account extract process
  ```
  $ bin/process.sh csvAccountExtractProcess
  ```
This should produce the output file in the data/ directory and if the debug log was enabled, the trace file in the status/ directory.

9. Edit the scheduler file and add this file in crontab (for cronjob)
  ```
  $ echo "* * * * * /path/to/sdl_scheduler.sh" >> crontab -e
  ```

Enjoy!
- Hamza

Credit Goes to : https://github.com/sthiyaga/dataloader [I've made some changes and added tested code].

