# Navigable::Router

[![Gem Version](https://badge.fury.io/rb/navigable-router.svg)](https://badge.fury.io/rb/navigable-router) [![Build Status](https://travis-ci.org/first-try-software/navigable-router.svg?branch=main)](https://travis-ci.org/first-try-software/navigable-router) [![Maintainability](https://api.codeclimate.com/v1/badges/514b9791fb670b7a3abb/maintainability)](https://codeclimate.com/github/first-try-software/navigable-router/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/514b9791fb670b7a3abb/test_coverage)](https://codeclimate.com/github/first-try-software/navigable-router/test_coverage)

Navigable is a family of gems that together provide all the tools you need to build fast, testable, and reliable JSON and/or GraphQL based APIs with isolated, composable business logic. The gems include:

<table style="margin: 20px 0">
<tr height="140">
<td width="130"><img alt="Clipper Ship" src="https://raw.githubusercontent.com/first-try-software/navigable/main/assets/clipper.png"></td>
<td>

**[Navigable][navigable]**<br>
A stand-alone tool for isolating business logic from external interfaces and cross-cutting concerns. Navigable composes self-configured command and observer objects to allow you to extend your business logic without modifying it. Navigable is compatible with any Ruby-based application development framework, including Rails, Hanami, and Sinatra.

</td>
</tr>
<tr height="140">
<td width="130"><img alt="Compass" src="https://raw.githubusercontent.com/first-try-software/navigable/main/assets/sextant.png"></td>
<td>

**[Navigable Router][router]** *(coming soon)*<br>
A simple, highly-performant, Rack-based router.

</td>
</tr>
<tr height="140">
<td width="130"><img alt="Compass" src="https://raw.githubusercontent.com/first-try-software/navigable/main/assets/compass.png"></td>
<td>

**[Navigable Server][server]** *(coming soon)*<br>
A Rack-based server for building Ruby and Navigable web applications.

</td>
</tr>
<tr height="140">
<td width="130"><img alt="Map" src="https://raw.githubusercontent.com/first-try-software/navigable/main/assets/map.png"></td>
<td>

**[Navigable GraphQL][graphql]** *(coming soon)*<br>
An extension of Navigable Server for building GraphQL APIs.

</td>
</tr>
</table>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'navigable-router'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install navigable-router

## Usage

To use `Navigable::Router` simply instantiate a router and add your routes:

```ruby
router = Navigable::Router.new
router.get('/ahoy', to: -> (env) { [200, { 'Content-Type' => 'text/html' }, [ 'Ahoy!' ]] })
```
The destination of the route needs to respond to `#call`, like the lambda above, or these classes:

```ruby
router.get('/swabbies', to: ShowSwabbies)
router.get('/swabbies/:id', to: ShowSwabbie)
router.post('/swabbies', to: CreateSwabbie)
router.put('/swabbies/:id', to: UpdateSwabbie)
router.delete('/swabbies/:id', to: DeleteSwabbie)
```
To run the app, add this to your config.ru:
```ruby
run router
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/first-try-softare/navigable-router. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/first-try-softare/navigable-router/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Navigable::Router project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/first-try-software/navigable-router/blob/master/CODE_OF_CONDUCT.md).

[navigable]: https://github.com/first-try-software/navigable
[router]: https://github.com/first-try-software/navigable-router
[server]: https://github.com/first-try-software/navigable-server
[graphql]: https://github.com/first-try-software/navigable-graphql
