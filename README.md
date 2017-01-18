# hp
This project is created by Team Resoneuronance.

Please find below the structure and brief description of project files - 

This is a MAVEN project which contains following files -

src/main/java -->
  This directory contains all the java code, which is the business logic of the application.
  
  -- dao -> This package contains all the database queries executed using hibernate and database POJOs. All the queries are self-explanatory.
  
  -- bo -> This has all the business logic methods. Take a look at api package inside this package to get overiview of business methods implemented. It consists of various methods like login, register, bookAppointment etc.
  
  -- controller -> This package contains 3 main controllers - Admin, Customer and Lab controller. Each controller is a spring MVC controller which performs routing of requests to BO methods. Additionally it has HPSecurityHandler which filters the requests based on login type of the user. e.g. for Admin all requests are permitted.
  
  -- util --> It contains all the utlity classes for methods like file reading, Jasper report generation etc. Important once are mappers like DataConverters which convert data objects i.e. Hibernate objects to Business objects and BusinessConverts to do vice-versa.
              Important thing is to change Constants.java class from this package at the time of production deployment to change the properties from DEV to PROD.
  
  
src/main/resources -->

  -- Jasper report .jrxml files which are used as report templates
  
  -- Email templates read by MailUtil.java
  
  -- SMS templates read by SMSUtil.java
  
  
src/main/webapp/WEB-INF

  -- hp-servlet.xml has spring-mvc configuration and Hibernate DB configurations. Important thing is to change DB properties for production.
  
  
src/main/webapp/WEB-INF/pages

  -- This contains all the .jsp pages.
  -- forms folder contains all the JSP sub-pages which are included in master JSP pages.
  

Write to us @ koreanand@gmail.com for any code-related queries.

Visit www.resoneuronance.com
