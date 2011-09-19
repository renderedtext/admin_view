# admin_view

Rails 3 generator of CRUD admin controllers, views and specs for existing models.

It uses [meta_search](https://github.com/ernie/meta_search) for search and [kaminari](https://github.com/amatsuda/kaminari) for pagination.

Screenshot:

![admin_view example screenshot](http://renderedtext.com/images/blog/admin_view.png)

## Usage

Include it in your Gemfile:

	gem "admin_view"

Run the generator:

	$ bundle exec admin_view User --search_by name_or_email

The `--search_by` option is not required - if you don't pass it, the form template will come out commented out. However, it's useful most of the time, and you can use any meta_search-compatible expression to search in string or text fields.

## Contributing

Yes! Feel free to fork the repo, make your changes in a topic branch and send us a pull request.

If you're having a problem or found a bug, please open an issue in the GitHub [issue tracker](https://github.com/renderedtext/admin_view/issues).

## License

Copyright © 2011 [Rendered Text](http://renderedtext.com). admin_view is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
