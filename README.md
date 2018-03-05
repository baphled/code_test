# Make it Cheaper Code Test

#### 1. Fork this project to you git
#### 2. Do the test

#### 3. When finish provide:
- Git url to allow us reading code
- details to find your lead submission (to find in our database)
- the token used (to find you leads in your databases)
- Url of the app (in case you have deploy your app in the cloud)

#### 4. Your app must start with:
- `rake db:create db:migrate` (If you use DB, sqlite3. Possible to do the test without any DB)
- `rails s`

## Development
    cd APP_ROOT_PATH
    bundle install
    RAILS_ENV=development rake db:create db:migrate
    rails s

## Prerequies server / development
    ruby 2.4.2
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn

### Environments variables

- `LEAD_API_PACCNAME`
- `LEAD_API_PGUID`
- `LEAD_API_PPARTNER`
- `LEAD_API_ACCESS_TOKEN`
- `LEAD_API_URI`
- `SECRET_KEY_BASE`
