<img src="logo_grupo.png" alt="Logo" width="200">

# OHDSI-VID_to_OMOP_ETL

## Table of Contents

- [Introduction](#introduction)
- [Organization](#organization)
- [Steps](#steps)
- [License](#license)
- [Acknowledgement](#acknowledgement)

## Introduction

This repository contains instructions and scripts for ETL from the VID dataset to OMOP CDM.

## Organization

The `doc` folder contains the following documentation:

- [1_VID_Catalogue.html](doc/1_VID_Catalogue.html): A description of the VID catalogue.

- [2_FISABIO_HSRP_ETL_Design_v_1_4.html](doc/2_FISABIO_HSRP_ETL_Design_v_1_4.html): A description of the ETL process.

The `src` folder includes R scripts in .qmd format and .sql instructions.

## Steps

### 1. Create a PostgreSQL Database

- Create staged tables from R (.qmd) scripts.

- Create a PostgreSQL database.

- Create a schema: 'vid_consign'.

- Run the .sql instructions.

- Create a schema: 'vid_consign_results' to store Achilles and DataQualityDashboard results.

- Create a schema: 'vid_consign_temp' to store temporal files.

- Run the Achilles tool (<https://github.com/OHDSI/Achilles>).

- Run the DataQualityDashboard tool (<https://github.com/OHDSI/DataQualityDashboard>).

### 2. Deploy a Local Atlas Instance

####  2.1. Set up the rights/users of the PostgreSQL database. 

- Refer to: <https://github.com/OHDSI/WebAPI/wiki/PostgreSQL-Installation-Guide>.

- Create **ohdsi_admin**, **ohdsi_admin_user**, **ohdsi_app**, and **ohdsi_app_user** login/group Roles.
  
#### 2.2. Set up local WebAPI.

- Refer to: <https://github.com/OHDSI/WebAPI/wiki/WebAPI-Installation-Guide>.

- Install: Java 8 Java Development Kit (JDK), Apache Maven, and Apache Tomcat.
  
- Clone the WebAPI project:
  
  ```console
  D:\Git\OHDSI> git clone https://github.com/OHDSI/WebAPI.git
  ```
  
- Create ***settings.xml*** file: In the root of the WebAPI project folder, there is a file named ***sample_settings.xml***. Copy this file into a new folder WebAPIConfig and rename it to ***settings.xml***. Note: WebAPIConfig will be subfolder off of the root WebAPI folder. Change the parameters according to the specifications following the guide.

- Build the ***WebAPI.war***. From the root of the WebAPI Project folder `D:\Git\OHDSI\WebAPI` run the following maven command to create the .war file, which will be used to deploy and run WebAPI:

  ```console
  D:\Git\OHDSI\WebAPI> mvn clean package -DskipUnitTests -DskipITtests -s WebAPIConfig/settings.xml -P    webapi-postgresql
  ```
- Configure Tomcat parameters:

  Before deploying WebAPI, configure Tomcat to allow logging into the manager interface. To do this, navigate to the conf folder `C:\tomcat\conf` and edit the file *tomcat-users.xml*. Add the following XML in the <tomcat-users> block:
  
  ```console
  <role rolename="manager-gui"/>
  <user username="tomcat" password="s3cret" roles="manager-gui"/>
  ```
  
  Next, configure the Tomcat manager application to allow uploads larger than 50MB to ensure WebAPI deployment. Edit the file: `C:\tomcat\webapps\manager\WEB-INF\web.xml` and find the section that reads:
    
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
- Login and deploy the .war file. Possibly, do you need to create some manual grants in pgadmin 4.

#### 2.3. Connect local WebAPI to the backend CDM tables

- Refer to: <https://github.com/OHDSI/WebAPI/wiki/CDM-Configuration>.

- Populate the WebAPI tables:

  - Open a browser and paste the following URL:
  
  ```console
  http://localhost:8080/WebAPI/ddl/results?dialect=postgresql&schema=vid_consign_results&vocabSchema=vid_consign&tempSchema=vid_consign_temp&initConceptHierarchy=true
  ```
  
  - A SQL script has been generated. Run it in the pgadmin 4.
  
- Create ***webapi_sa*** user and create the corresponding permissions.
  
- Define *source* and *source_daimon* tables.

- Check that everything is OK at <http://localhost:8080/WebAPI/source/refresh>.

#### 2.4. Set up local Atlas.

- For this step, follow the guide: <https://github.com/OHDSI/Atlas/wiki/Atlas-Setup-Guide>.

- Download the [latest release of Atlas](https://github.com/OHDSI/Atlas/releases).

- From the root of the `Atlas` folder, run the following command:

  ```console
  D:\git\ohdsi\Atlas> npm run build
  ```
- Copy the Atlas folder into `C:\tomcat\webapps`.

- Check that everything is OK at <http://localhost:8080/Atlas>.

#### 2.5. Reopen local Atlas.

It is possible to reopen the Atlas local following the next steps.

- Start the PostgreSQL connection:

   ```console
   pg_ctl -D D:\PostgreSQL\pgsql\data -l logfile start
   ```

- Start tomcat:

   ```console
   C:\tomcat\bin> catalina.bat run > ..\logs\webapi.log 2>&1
   ```

- Grant permissions on the 'webapi' schema sequences to the ohdsi_app_user.

- Start WebAPI app from the tomcat manager: <http://localhost:8080/manager/html>.

- Check that everything is OK at <http://localhost:8080/Atlas>.

### 3. Run the inspection tools and catalogue export

- Run the CDMInspection tool (<https://github.com/EHDEN/CdmInspection>).

- Run the CatalogueExport tool (<https://github.com/EHDEN/CatalogueExport>).


## License

OHDSI-VID_to_OMOP_ETL is licensed under Apache License 2.0.

## Acknowledgement

The European Health Data & Evidence Network has received funding from the Innovative Medicines Initiative 2 Joint Undertaking (JU) under grant agreement No 806968. The JU receives support from the European Union’s Horizon 2020 research.
