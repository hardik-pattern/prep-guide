Q. Five things to keep in mind -
  1. Avoid detailing early. Lay down a very high level architecture end to end. Do not go in definding details of one component.
  2. Avoid silver bullets. Dont have a set architecture in mind. Theres no single architecture thatll fit everywhere.
  3. K. I. S. S - Keep it simple and stupid. The more details you get into one component, the narrower your view is.  Take a step back and take a look at the entire architecture.
  4. Form your thoughts.  Avoid speaking without thinking the point through.
  5. Be tech aware.

Resume prep -

1. Work on continues development and deployment
  - So this not in the context of CI/CD pipeline.
  - There was a weekly deployment of the enhancements, bugs and feature deliveries.
  - The product had a lot of big clients and some of them used to have hard and fast deadlines and those needed to deployed when the clients wanted it to be.
  - So in that cases these features were carried out apart from the normal deployment sprints and were delivered indepently.
  - There were also used to be production bugs which had to be addressed as soon as possible and fixed and deployed. So that was also a kind of continuos delivery kind of thing.
  - So in these sense it was continues development and deployment.

2. MongoDB efficient queries
  - The software was written some 15 years back and was not very well structured actually. It must be due they had to have instant MVP to cater to the clients and all.
  - Since the product was scaling their was need to enhacements and all so first thing to improve performance was to optimise queries.
  - There was Activity model which had subtypes like email, call, sms, whatsapp, followup, etc.
  - On database level Single Table Inheritance was implemented for this, that meant every query on these subtypes was going into same table and these communication models were very heavily in the business logic of the application.
  - These queries were also not properly indexed and queries were taking a lot of time.
  - Since these indexes were compound indexes we had to query it in the order.
  - So we built a criteria filter for these queries where we checked which type of Activity is this and according build the criteria first and then did the .where() query on Activity.

3. Redis caching to optimise frequently accessed data
  - So there was one task I had to carry out. Users had many buckets like - news leads, scheduled followups and sitevisists and more. And the Dashboard for all users accross all clients were fixed.
  - We also had provision where clients can make there custom buckets and check whatever the data they want to check in those.
  - So clients were coming up with requirements where they also wanted to see their custom buckets on the User Dashboards.
  - So this was a cumbersome task as everytime when the user will come at the dashboard the queries will get fired very frequently for fetching the custom buckets data.
  - So I used redis to cache the data of the custom buckets as soon as the user logins we will check which custom buckets the user has enabled for the viewing on the dashboard.

4. Strictly following design practices like SOLID principle
  -

5. Major Ruby on Rails version upgrades twice
  - Rails 4.2 to Rails 5.2 was heavy task, first we tried to jump to Rails 5.2 directly, we had read the documentation
  - Strong Parameters and Introduction of Action cable
  - Rails 5.2 to 6.0 was relatively easier than the previous there very less breaking changes
  - We had already upgraded our ruby to 2.7.7 and sidekiq to 6 so did not face a lot major issues.
  - However we wanted to upgrade our sidekiq to 7 and the delay method was removed so we have to rely
6.

