# Applicado: A Job Board Demo

## Initial requirements

Create a simple two-sided web application for applicants and employers.

An applicant should be able to:
* Log in with email and password. No email confirmation needed.
* See all available job openings for various employers.
* Job openings should contain a title and description and the employer name.
* Have a button to apply to a job opening they have not applied to before.
* An applicant should not be able to apply to the same job opening twice.

An employer should be able to:
* Log in with email and password. No email verification needed
* Create job openings.
* See all the applicants who applied to their job openings by name.

There does not need to be any styling and we are not evaluating the frontend code.


## Additional functionality

I added the following features not specified in the initial requirements:

* Display posting date for each job listing.
* Store a location field and display it for each job listing.
* Display the posting date for each job listing.
* Job applicants can add an optional message when applying to a job.
* Applicants can see a list of jobs they have applied to.
* Employers can see the email address and message (if any) along with the name of each applicant who applied to their job openings.
* Created an Admin user class and entitlements.
* A "forgot password" reset request form (included with Devise gem installation). Note that the form is non-functional, as email capability has not been configured for the demo.
* Various authentication and authorization functionality included with Devise and Pundit.


## Known errors:

I did not prepare tests for this project, due to a lack of time. Generally, I consider minitest or RSpec for automated testing; Capybara for integration testing.

There is an outstanding issue related to custom rendering of flash messages:  When an employer submits a new job opening form without completing all fields, the expected error message is displayed. However, if they resubmit the form and still have omitted at least one field, then additional error messages will appear. If the user then navigates away from the form without successfully submitting it, the flash message persists on the next page.


## Installation

The demo is a Ruby on Rails application, developed on a Windows PC.
* Clone or [download](https://github.com/joecanas/applicado/archive/master.zip) the git repository

In the application's main directory:
* Run "bundle install"
* Run "rake db:migrate"
* Run "rake db:seed"

The seed file will create a dozen sample job openings, as well as test accounts for the three user classes:
* applicant1@test.com
* applicant2@test.com
* applicant3@test.com
* employer1@test.com
* employer2@test.com
* employer3@test.com
* admin1@test.com

All test accounts have the same password:  "password"

Start the server (!):
* Run "rails s"


# Questions

Q. Should there be a master administration account that can view all job openings regardless of employer? If so, should the admin also be able to post job openings on behalf of any employer?

A. Yes. However, the admin account(s) can only be created manually via db:seed or SQL insert.

Q. At a minimum, job descriptions must contain title, description and employer name. Should the app include additional/common job posting fields such as location, employment type (full time, part time, contract, hourly, freelance), level (entry, mid-level, senior), salary, etc.?

A. I implemented "location" to illustrate how this might work for additional job fields. Other relevant fields may be added in a future version.

Q. If we let an employer log in as an applicant and apply to jobs, should they be able to apply to their own job openings as well as those from other employers? If not, then should they still see their own job openings, displayed with a "you can't apply" message instead of an application button? Or should they not see their own job openings at all?

A. Only the "applicant" user class can apply to jobs.

Q. An applicant should be able to see all job openings. Should they have the ability to filter this list to see:

* only jobs they have applied to; [currently possible with "My job openings"]
* only jobs they have not applied to;
* only jobs from a specific employer;
* all jobs (default view)
* only jobs by location (with or without geolocation functionality to display, e.g., "within x miles" results)

A. Not for the demo. Consider for future enhancement.

Q. If an employer edits a job posting, should the "updated_at" value appear as the job's posted date displayed on the site, rather than the "created_at" date?

A. Not for the demo. Consider for future enhancement per business requirements.

Q. Should an employer only be able to post jobs for a single entity (i.e., "Company" or company name)? Or should they have the ability to post to multiple entities (similar to a recruiter representing multiple companies, or an in-house corporate recruiter posting jobs for different divisions within one or more parent entities)?

A. For the demo, employers can enter any value into the "Company" field of a job posting; thus, they can post jobs on behalf of multiple companies. This is practical (and easier to implement); however, it might not be suited to actual business requirements. Alternatively, the application could collect a company name from new employers during the signup process, and use that value similarly to first_name and last_name. (Should subsequent company name changes affect existing job postings?)


# Assumptions:

## Why Ruby on Rails?

My main assumption was that this assignment was intended solely to demonstrate my general approach to application development. The "final product" after one week of effort was never intended for production release (even though Rails prototypes occasionally/infamously find their way into production).

I chose Ruby on Rails primarily to speed up development using available libraries/gems for common functionality (authentication, authorization, pagination, etc.). However, there are tradeoffs when using a framework (regardless of programming language) -- even for rapid demo/prototype work. In a true production-bound project, an engineering team should consider those tradeoffs with regard to business strategy, time to market, scalability, team size, etc. when selecting (or inheriting) a tech stack. 


## [System quality attributes](https://en.wikipedia.org/wiki/List_of_system_quality_attributes)

The top quality traits (so-called "-ilities") I consider when developing an application:
* Security
* Usability
* Performance
* Availability (Reliability)
* Scalability
* Extensibility
* Maintainability (Flexibility/Testability)

For this demo, I considered these and other traits -- and chose to pursue only some of them in the interest of time.


## What should this demo application do (beyond the initial requirements)?

At signup, users must provide a valid email address as their username. Initially, there will not be any email verification of new accounts, but a future version could implement a two-step email confirmation process.

The username (email) will be case insensitive.

The system will store a cryptographically strong hash of the password submitted at signup.

Only one identity will be associated with a user account. (This has implications for, e.g., social network/third-party identity login.)

Users will have the ability to log out.

The application will have one gateway entry page where users can choose to sign up as applicants or employers.

There will also be an admin user class, which can only be created outside of the application (i.e., manual database insert).

The main page will show an abbreviated view of all job listings (paginated).

Anonymous visitors can only view the abbreviated job listings. They must log in to be able to click job titles to see full descriptions, as well as use the features exposed to each of the user classes.

When a user logs in, they will see the logged-in view for their user class (applicant, employer, admin).

Applicants can:
* view full descriptions for job listings
* apply to jobs
* view their job applications

Applicants cannot post job openings.

Employers can:
* view full descriptions for all job listings
* create, edit and delete job openings tied to their employer identity
* view a list of all job openings they have created
* view all applicants who applied to their job openings, by name

Employers can't apply to jobs from any company, including their own.

Admins can:
* create, edit and delete all job openings
* view job openings with lists of applicants

Every user can edit their account details or delete their account.

Each employer has its own user account correlating to that employer identity. No more than one "employer" user can post jobs on behalf of the underlying "employer" identity. (However, in the current version, an employer may provide any company name when posting jobs.)

Listings of job openings for all users will be paginated vs. displayed in a continuous static or infinite scroll.

Pagination will be configurable within the application code, vs. user-customizeable within the browser.

There won't be a search option to find specific jobs by, e.g., keyword, phrase or employer.

Applicants will always see a complete listing of all jobs, but they will see a "You've already applied" message instead of an "apply" button for all jobs they have already applied to.

The job entry form "description" field will accept any text, but it will not format line breaks or strip HTML or JavaScript. A future enhancement should provide a WYSIWYG editor as well as translate textarea line breaks into HTML (or Markdown).


# Proposed Future Development

## What features could be added to enhance a job board application?

Given more time, business direction, resources, etc., I would consider the following (not an exhaustive list):

Evaluate and modify UI/UX:
* Validate behavior and fulfillment of requirements with internal stakeholders.
* Conduct user testing and incorporate feedback into subsequent iterative design stage.
* Apply UI/UX principles to page layout and functionality.
* Validate responsive behavior, i.e., test design on mobile, tablet, desktop.
* Style the application to reflect company and product branding (consider Bootstrap + Bootstrap Forms).

Add content pages:
* Custom error pages
* Terms of Use
* Privacy Policy
* About Us
* FAQ / how-to
* Contact Us (with email form)
* Articles tailored to each audience (applicants / employers)

Add functionality:
* WYSIWYG editor for job postings
* Search and filter (consider Algolia)
* Additional data fields for job posts
* Employer profiles
* Enhanced location filtering (consider Geocoder for identifying location ranges for searching)
* Application process management * provide workflow tools so applicants and employers can manage applications and interact throughout defined hiring process stages.
* Email capability to support two-step signup confirmations, password resets, etc.
* Social login (consider Omniauth)
* Accepting payments, e.g., from employers (consider Stripe)
* Email (consider SendGrid)
* Job boards typically list the hours or days since a listing has been posted ("3 days ago"), rather than the actual posting date. Add functionality to translate job posting dates with a "time elapsed since posting date" value.
* Add location lookup and granular filtering on location data fields
  * Capture additional location fields (e.g., city, state, ZIP; or just ZIP) to allow additional filtering (e.g., "within x miles")
  * Add predictive location lookup on new job post form, to speed data entry and eliminate naming inconsistencies


## Additional enhancements to consider:

* Implement a rational password policy (e.g., require strong passwords conforming to industry best practices).

* Separate the concept of user identity and user account, and allow multiple identities to link to a single user account. Keep the concepts of user account and credentials separate, to simplify the process of implementing third-party identity proviers, allowing users to change their username and linking multiple identities to a single user account.  In practical terms, it may be helpful to have an internal global identifier for every user and link their profile and authentication identity via that ID as opposed to piling it all in a single record.

* Implement rules on session length: Consider how long a user should be able to be inactive before re-authenticating. Verify user identity in all active sessions if someone performs a password reset. Prompt for authentication or 2nd factor if a user changes core aspects of their profile or when they're performing a sensitive action. Consider whether it makes sense to disallow logging in from more than one device or location at a time.

* Add the ability to view all jobs from a specific employer. This can be part of site search as well as available via link within individual job listings.

* Notify any applicants if an employer deletes a job opening that they have applied to. (Determine how to display such items to applicants, e.g., via a dashboard message center.)

* Allow employers to clone job openings.

* Provide a top-level profile field for employers to populate with a description of their company. This can be inserted into the employer's job openings automatically.

* Consider archive vs. delete of job openings. Should "deleted" jobs simply be removed from active posting, yet remain viewable in an employer's dashboard view for archive/auditing/compliance purposes?

* Add functionality for managing and promoting applicants through various stages of the hiring process, e.g., scheduling and notifications.
