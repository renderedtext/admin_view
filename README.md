# admin_view

<a href="https://semaphoreapp.com/renderedtext/admin_view"><img src="https://semaphoreapp.com/api/v1/projects/c79efd73c074db14c6829472459f2149fad0e068/327/badge.png"></a>

Code generator of CRUD admin controllers, views and specs for existing ActiveRecord models. It helps you get the data on screen immediately, so you can customize the specifics to your liking.

It works with Rails 4 and uses [ransack](https://github.com/activerecord-hackery/ransack) for search and [kaminari](https://github.com/amatsuda/kaminari) for pagination.

The produced markup in views is compatible with [Bootstrap 3](http://getbootstrap.com).

Screenshot:

![admin_view example screenshot](http://cl.ly/image/1o3n1P153V0O/Screen%20Shot%202014-05-16%20at%2014.57.29%20.png)

## Usage

Include it in your Gemfile:

	gem "admin_view"

Run the generator:

	$ bundle exec rails g admin_view User --search_by name_or_email

The `--search_by` option is not required. However, it's useful most of the time, and you can use any ransack-compatible expression to search in string or text fields.

Other options available are:

* `--no_create` - omit functionality to create a new record
* `--read_only` - omit create, edit and update functionality

## Contributing

Yes! Feel free to fork the repo, make your changes in a topic branch and send us a pull request.

If you're having a problem or found a bug, please open an issue in the GitHub [issue tracker](https://github.com/renderedtext/admin_view/issues).

## Credits

Big thank you to all [the contributors](https://github.com/renderedtext/admin_view/graphs/contributors)!

## License

Copyright © 2011-2014 [Rendered Text](http://renderedtext.com). admin_view is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
