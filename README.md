# SimpleFeatures

This gem was design to 1 thing and it well. (me thinks)

The reason for why I started to write this gem is that of all the feautre gems, it was
quicker to write this gem than learn how they work And thats why this gem is overly darn so simple

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_features'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_features

## Usage


### Basic usage

this can be assigned any where in code as

```ruby
features = SimpleFeatures::Features.new( { feature_a: true, feature_a: false } )

puts "feature_a" if features.feature_a?
puts "feature_b" if features.feature_b?

```

### Via Config file

```ruby
features = SimpleFeatures::Features.load_config('config/simple_features.yml')
```

#### example config file

```yaml
production:
  feature_one: true
  feature_two: false
  feature_three: true

```

```ruby
puts features.feature_one?
>> true

puts features.feature_two?
>> false

puts features.feature_three?
>> true

```


### Rails & Rails Helpers

`Rails` only needs to have the config file in `config/simple_features.yml`


```bash
rails generate simple_features

```
this will drop a template config: `config/simple_features.yml`

if you want to use the generator to create with feature names do the following
```bash
rails generate simple_features --features new_tool old_tool new_idea

puts features.new_idea?
>> true

```

## examples

### within Rails Views

```html
<body>
<%= link_to 'New Feature', new_feature_path if features.new_feature? %>
</body>
```

using simple features wrap around debugging coding (dont do this , its an example )

```ruby
logger.debug "some aweomse words!" if features.debugging?
```


## Tests

None. its simple... ok you got me I should write some. %TODO%
