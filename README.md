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

- [2_FISABIO_HSRP_ETL_Design.html](doc/2_FISABIO_HSRP_ETL_Design.html): the ETL description.

In the `src` folder are contained the R scripts in .qmd format and the .sql instructions.

## Steps

1. Create the staged tables from R (.qmd) scripts.

2. Create a PostgreSQL database.

3. Run the .sql instructions.

## License

OHDSI-VID_to_OMOP_ETL is licensed under Apache License 2.0.

## Acknowledgement

The European Health Data & Evidence Network has received funding from the Innovative Medicines Initiative 2 Joint Undertaking (JU) under grant agreement No 806968. The JU receives support from the European Union’s Horizon 2020 research.