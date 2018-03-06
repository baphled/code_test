# Make it Cheaper Code Test

#### 1. Fork this project to you git

#### 2. Do the test
- Api Documentation on http://mic-leads.dev-test.makeiteasy.com/api/v1/docs
- Copy/paste .env.example to .env
- Cetup Api token provide by Make It Cheaper
- `bundle install`
- `rails s`

#### 3. When finish provide:
- Git url to allow us reading/run code
- The token used (to find you leads in your databases)
- **Bonus only**: Url of the app (in case you have deploy your app in the cloud)

#### 4. Your app must start with:
- `bundle install`
- `rake db:create db:migrate` (If you use DB, sqlite3. Possible to do the test without any DB)
- `rails s`

## Prerequies server / development
    ruby 2.4.2
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn

## Test
    bundle exec rspec

### Environments variables
Check .env.example
- `LEAD_API_PACCNAME`
- `LEAD_API_PGUID`
- `LEAD_API_PPARTNER`
- `LEAD_API_ACCESS_TOKEN`
- `LEAD_API_URI`
- `SECRET_KEY_BASE`
