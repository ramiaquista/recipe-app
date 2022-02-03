# Recipe RoR Application

> A Recipe List Application that allows user registration, creates recipes with already created (and available) foods and shows a customized shopping list based on necessary but unavailable food from the recipe.

## Built With

Ruby >= 3.0.0

Rails >= 7.0.0

Postgresql >= 12.0

## Getting Started

- To get a local copy of the repository please run the following commands on your terminal:
   ```
   git clone https://github.com/lfmnovaes/recipe-app.git
   ```
- Go to the cloned directory with `cd recipe-app`
- Run `bundle install` to install the necessary packages
- Install the `postgresql` database and all necessary dependencies (if you are on Ubuntu just run `sudo apt install postgresql postgresql-contrib`)
- Run `rails db:create` to create the database locally or if already have one with the same name run `rails db:reset` instead
- After installing everything, you can run now the website with `rails s`

## Running linters
- Rubocop (Ruby code linter)
```
rubocop
```
- Stylelint (CSS linter)
```
npx stylelint "**/*.{css,scss}"
```

## Testing
- Using RSpec and Capybara
``` 
rspec spec/
```

## Authors

👤 **Luís Fernando**

- GitHub: [![@lfmnovaes](https://img.shields.io/github/followers/lfmnovaes?color=lightgray&style=plastic&labelColor=blue)](https://github.com/lfmnovaes)
- Twitter: [![@lfmnovaes](https://img.shields.io/twitter/follow/lfmnovaes?style=plastic&labelColor=blue)](https://www.twitter.com/lfmnovaes/)
- LinkedIn: [![@lfmnovaes](https://img.shields.io/badge/LinkedIn-blue?style=plastic&logo=linkedin)](https://www.linkedin.com/in/lfmnovaes/)

👤 **Ramiro Aquistapace**

- GitHub: [@ramiaquista](https://github.com/ramiaquista)
- Twitter: [@ramiaq1](https://twitter.com/ramiaq1)
- LinkedIn: [RamiroAquistapace](https://www.linkedin.com/in/ramiro-aquistapace-32b61b204/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./LICENSE) licensed.
