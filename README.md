# MALLSTER API
>  A web API that retrieves a list of products, details about each product and a list of favorites products.

## Table of Contents

* [Endpoints](#features)
* [Live Demo](#demo)
* [Installation](#installation)
* [Getting Started](#getting-started)
* [Built With](#built-with)
* [Contributing](#contributing)
* [Acknowledgments](#acknowledgments)
* [Authors](#author)
* [License](#license)

## Endpoints

| TYPE          | URL                | EXPECTED                                          |
| ------------- | ------------------ | ------------------------------------------------- |
| GET           | /products          | JSON (products info)                              |
| GET           | /products/:id      | JSON (product details)                            |
| GET           | /favorites         | JSON (all favorite user's products)               |
| POST          | /favorites/        | Add a favorite product to the list of favorites   |
| DELETE        | /favorites/:id     | Remove a favorite product from user's favorites   |
| POST          | /registrations     | JSON (create and register a new user)             |
| POST          | /sessions          | JSON (log an already registered user in)          |
| GET           | /logged_in         | JSON (check if a user is logged in aginst db)     |

## Demo

  - https://eshop-be-1418.herokuapp.com

## Installation

  - Make sure to have [PostgreSQL](https://www.postgresql.org/) installed and configured as the database.
  - Clone the repo locally with the command `git clone git@github.com:dansantander/eshop-be.git`.
  - Navigate to the project folder inside your terminal.
  - Run `bundle` or `bundle install`.

## Getting Started

  - Head over your server on localhost:3000, or localhost:3001 if you'll be testing the front-end<br>
  and back-end of this app simultaneously.

## Built With

  - Ruby 2.6.5 <br>
  - Ruby on Rails 5.2.4 <br>
  - Git, Github and VScode <br>
  - RSpec
  - Faker <br>

## Contributing

Contributions, issues and feature requests are welcome!

You can do it on [issues page](issues/).

## Acknowledgments

Special thanks to code reviewers.

## Show your support

Give a ⭐️ if you like this project!

## Authors

👤 **Daniel Santander**

- Github: [@dansantander](https://github.com/dansantander)
- Linkedin: [Daniel Santander](https://www.linkedin.com/in/daniel-santander)
- Twitter: [@dansantandr](https://twitter.com/dansantandr)

## License

<strong>Creative Commons 2020</strong>