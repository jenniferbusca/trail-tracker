# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (COMMENTS: User, Trails, UserTrails)
- [x] Include at least one has_many relationship on your User model (COMMENTS:  User has_many UserTrails, Trails has_many UserTrails)
- [x] Include at least one belongs_to relationship on another model (COMMENTS:  UserTrails belongs_to User and Trails)
- [x] Include user accounts with unique login attribute (COMMENTS: username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users (COMMENTS: User can delete self, admin user can delete trails)
- [x] Include user input validations (COMMENTS: User must signup with username, password and email. Email must have @ and be greater than 5 chars)
- [x] BONUS - not required - Display validation failures to user with error message (COMMENTS: failure page, uses locals to display specific error)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
