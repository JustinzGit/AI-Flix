# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship
* user has_many playlists

- [x] Include at least one belongs_to relationship
* playlist belongs_to user

- [x] Include at least two has_many through relationships
* actor has_many movies through movie_actors
* movie has_many actors through movie_actors

- [x] Include at least one many-to-many relationship
* actor has_many movies
* movie has_many actors

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
* user validations email, username, password, password confirmation

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user
* Review Join Table, user_review attribute

- [x] Include nested resource show or index
* users/2/playlists

- [x] Include form display of validation errors
* new users view reveals validation errors if any

- [x] Include signup
- [x] Include login
- [x] Include logout

# TO-DO

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)

- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
