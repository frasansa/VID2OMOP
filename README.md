<img src="logo_grupo.png" alt="Logo" width="200">

# OHDSI-VID_to_OMOP_ETL

## Table of Contents

- [Introduction](#introduction)
- [Organization](#organization)
- [Steps](#steps)
- [License](#license)
- [Acknowledgement](#acknowledgement)

## Introduction

This repository contains the instructions and scripts for ETL from VID dataset to OMOP CDM.

## Organization

In the `doc` folder are contained the documentation: 

- [1_VID_Catalogue.html](doc/1_VID_Catalogue.html): the VID catalogue description.

- [2_FISABIO_HSRP_ETL_Design_v_1_4.html](doc/2_FISABIO_HSRP_ETL_Design_v_1_4.html): the ETL description.

In the `src` folder are contained the R scripts in .qmd format and the .sql instructions.

## Steps

### 1. Create a PostgreSQL database

####  1.1. Create the staged tables from R (.qmd) scripts.

####  1.2. Create a PostgreSQL database.

####  1.3. Create a schema: "vid_consign". 

####  1.4. Run the .sql instructions.

####  1.5. Create a schema: "vid_consign_results" to store the achilles and DataQualityDashboard results.

### 2. Deploy an Atlas local instance

####  2.1. Setup the rights/users of the PostgreSQL database. 

- For this step we will use the following guide: <https://github.com/OHDSI/WebAPI/wiki/PostgreSQL-Installation-Guide>.
  We will create the **ohdsi_admin**, **ohdsi_admin_user**, **ohdsi_app**, and **ohdsi_app_user** Login/Group Roles.
  
#### 2.2. Setup local WebAPI 

- For this step we will use the following guide: <https://github.com/OHDSI/WebAPI/wiki/WebAPI-Installation-Guide>.

- Install:
  - Java 8 Java Development Kit (JDK).
  - Apache Maven.
  - Apache Tomcat.
  
<br>

- Clone the WebAPI project:
  
  ```console
  D:\Git\OHDSI> git clone https://github.com/OHDSI/WebAPI.git
  ```
- Create ***settings.xml*** file: In the root of the WebAPI project folder, there is a file named ***sample_settings.xml***. Copy this file into a new folder WebAPIConfig and rename it to ***settings.xml***. Note: WebAPIConfig will be subfolder off of the root WebAPI folder. Change the parameters according to the specifications following the guide.

- Build the ***WebAPI.war***. From the root of the WebAPI Project folder (D:\Git\OHDSI\WebAPI) run the following maven command to create the .war file which will be used to deploy and run WebAPI:

  ```console
D:\Git\OHDSI\WebAPI> mvn clean package -DskipUnitTests -DskipITtests -s WebAPIConfig/settings.xml -P webapi-postgresql
  ```
- Configure Tomcat parameters:

  Before we can deploy WebAPI, we need to configure Tomcat to allow us to log into the manager interface. To do this, navigate to the conf folder ` C:\tomcat\conf` and edit the file *tomcat-users.xml*. Add the following XML in the <tomcat-users> block:
  
  ```console
  <role rolename="manager-gui"/>
  <user username="tomcat" password="s3cret" roles="manager-gui"/>
  ```
  
  Next, we will need to configure the Tomcat manager application to allow for uploads larger than 50MB to ensure we can deploy WebAPI. Edit the file: ` C:\tomcat\webapps\manager\WEB-INF\web.xml` and find the section that reads:
    
    ```console
    <multipart-config>
      <!-- 50MB max -->
      <max-file-size>52428800</max-file-size>
      <max-request-size>52428800</max-request-size>
      <file-size-threshold>0</file-size-threshold>
    </multipart-config>
    ```
    
  Update this to read:
    
    ```console
    <multipart-config>
      <!-- 1500MB max -->
      <max-file-size>1548576000</max-file-size>
      <max-request-size>1548576000</max-request-size>
      <file-size-threshold>0</file-size-threshold>
    </multipart-config>
    ``` 

- Deploy WebAPI using Tomcat Application Manager. Start Tomcat, open a command prompt and navigate to the bin folder where you installed Tomcat ` C:\tomcat\bin` and run:

    ```console
    C:\tomcat\bin> catalina.bat run > ..\logs\webapi.log 2>&1
    ```
#### 2.3. Connect local WebAPI to the backend CDM tables

- For this step we will use the following guide: <https://github.com/OHDSI/WebAPI/wiki/CDM-Configuration>.
  
#### 2.4. Setup local Atlas:

- For this step we will use the following guide: <https://github.com/OHDSI/Atlas/wiki/Atlas-Setup-Guide>.
  
## License

OHDSI-VID_to_OMOP_ETL is licensed under Apache License 2.0.

## Acknowledgement

The European Health Data & Evidence Network has received funding from the Innovative Medicines Initiative 2 Joint Undertaking (JU) under grant agreement No 806968. The JU receives support from the European Union’s Horizon 2020 research.
