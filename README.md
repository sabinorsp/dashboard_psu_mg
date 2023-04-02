# Project Descriptions: 
  This project aimed to create a web application with the dashboard model ( using Python, statistical software R and the Shiny framework) for loading and making avaliable data regarding the notes of the selective process of medical residency of the PSU of the year 2022 in Minas Gerais Brazil. 
  
  The data are originally available via a pdf document on the http://www.aremg.org.br/ portal, that is, the document contains a list of all the specialties and hospitals that are part of the selection process.
  
  The motivation to create this Dashboard was to facilitate research on the results of the 2022 PSU-MG selection process and also to provide the user (the candidate) with a direct and simplified view.

# Objectives: 
The web Dashboard must allow the candidate to:
  * Search filters by Specialty;  
  * Search filters to select the desired Hospital;  
  * Visualization of the results given the filter by specialty in table format:
    * List of hospital names with the number of subscribers, average of the total score and the score that make up the 3rd quartile of the distribution;  
    * Enable pagination and table view limit;  
    * Filter for searching the table;  
    * Ordering data by desired category.  
  * Presentation of the note (Histogram) given the specialty and hospital filters;  
  * Presentation of a statistical summary of test scores, curriculum score and total score (maximum, minimum, average, median, 1st and 3rd quartile) given the desired specialty and hospital filter.

# How to run: 
## Versions Packages: 
  * R: 4.2.1
  * 
 Run `ui.server` on RStudio and Run App.

# Results: 

![](/img_examples/front1.png)

![](/img_examples/front2.png)

![](/img_examples/front3.png)

This application was put into production in the AWS environment from 12/22/2022 to 01/22/2023 to be made available to users (candidates referring to the 2023 selection process) in order to collect some feedback for future improvements.
