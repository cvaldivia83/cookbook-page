
## Cookbook App

![Cookbook App Landing Page](https://ik.imagekit.io/kifd4nz2wokt/Screen_Shot_2021-08-09_at_17.33.28_BmekaPH5B.png?updatedAt=1628541245686)


### Cookbook
A place to track your favorite recipes and remind you to do some kitchen innovation, keeping a mindful, healthy diet.

### Deploy

To use Cookbook App, download a zip file from Github ().

After unzipping and saving the contents to your desired directory, run `bundle install` in your terminal to install all the gems required for this program.

From within your directory, run `rackup config.ru` in the terminal. Then open localhost:9292 in a web browser. This program will run.

To quit the program exit your web browser and type "ctrl + c" in your terminal to exit your local server.

Or if you wish, just click [here](https://cookbook-db-sinatra.herokuapp.com/).

Please, wait a little minute for the page to load. I am using a free hosting service and it can be a little slow the first time you open the page.

Thank you for your patience and your time. 🙃

### Technologies
 - Ruby
 - Sinatra
 - Postgresql
 - Bootstrap
 - Nokogiri

### Resources
|route|method|description
|--|--|--|
|'/'| GET | landing page |
|'/new'|GET/POST|new recipe|
|'/import'| GET/POST| imports recipe
|'/recipes/:id'| DELETE| deletes recipe
|'/recipe/:id'| GET | imports recipe




> Written with [StackEdit](https://stackedit.io/).
