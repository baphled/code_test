# Money Super Market
|environement|status|
|---|---|
|production|[![Build Status](https://semaphoreci.com/api/v1/projects/672f4ea8-50d5-4d2a-aa1e-65dc323761d3/1735107/badge.svg)](https://semaphoreci.com/makeitcheaper/msm-rails)|
|staging|[![Build Status](https://semaphoreci.com/api/v1/projects/672f4ea8-50d5-4d2a-aa1e-65dc323761d3/1735106/badge.svg)](https://semaphoreci.com/makeitcheaper/msm-rails)|
|master|[![Build Status](https://semaphoreci.com/api/v1/projects/672f4ea8-50d5-4d2a-aa1e-65dc323761d3/1735091/badge.svg)](https://semaphoreci.com/makeitcheaper/msm-rails)|
|production|[![Production Status]( https://app.cloud66.com/stacks/badge/6196e5a60de5fdbf633139986b9d6673.svg )](https://app.cloud66.com/stacks/50237)|
|production|[![Production Status]( https://app.cloud66.com/stacks/badge/1386aa0125193a4ffa384b26a7d70006.svg )](https://app.cloud66.com/stacks/50243)|

## Development
    cd APP_ROOT_PATH
    bundle install
    RAILS_ENV=development rake db:create
    RAILS_ENV=development rake db:schema:load
    rails s
Will be usefull to work with contentful credentials STAGING or PRODUCTION (daa are already populated)

## Prerequies server / development
    ruby 2.4.2
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn

### Environments variables

- `CONTENTFUL_ACCESS_TOKEN`
- `CONTENTFUL_MANAGEMENT_TOKEN`
- `CONTENTFUL_PREVIEW_ACCESS_TOKEN`
- `CONTENTFUL_SPACE`
- `CONTENTFUL_WEBHOOK_USERNAME`
- `CONTENTFUL_WEBHOOK_PASSWORD`
- `DB_HOST`
- `DB_USERNAME`
- `DB_PASSWORD`
- `LEAD_API_PACCNAME`
- `LEAD_API_PGUID`
- `LEAD_API_PPARTNER`
- `LEAD_API_ACCESS_TOKEN`
- `LEAD_API_URI`
- `SECRET_KEY_BASE`

**Staging only (basic auth to hide staging from public)**
- `STAGING_USERNAME`
- `STAGING_PASSWORD`
