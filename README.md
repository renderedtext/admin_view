# admin_view

Rails 4 generator of CRUD admin controllers, views and specs for existing ActiveRecord models.

It uses [ransack](https://github.com/activerecord-hackery/ransack) for search and [kaminari](https://github.com/amatsuda/kaminari) for pagination.

The produced markup in views is compatible with [Bootstrap 3](http://getbootstrap.com).

Screenshot:

![admin_view example screenshot](http://renderedtext.com/images/blog/admin_view.png)

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

## License

Copyright © 2011-2014 [Rendered Text](http://renderedtext.com). admin_view is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
