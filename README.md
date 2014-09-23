# Clever

This gem gives a full stack of tools to give artificial intelligence for your Ruby application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clever'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clever

## Usage

Just extend a class like this:

```ruby
class Tweet
    extend Clever

    # The attribute :feeling should be an attribute of the model, when it's filled, the class will learn from it,
    # otherwise, the learning process will store the result on it
    classifiable :feeling do
        # The first thing to do is to declare do algorithm to use
        machine_learning 'NeuralNetwork'

        # You can pre-process a data from given pre-processing algorithms
        process 'Integerize' do
            input :char_length do
                tweet.length
            end
        end

        process 'Normalize' do
            input :created_at
        end

        # Or you can just use an input from class attributes
        input :retweets do
            retweets.size
        end

        # You can post-process the result or do whatever you want
        result do |r|
            raise Sadness if result == 'sad'
        end
    end
end
```

In a Rails Application, you can just use classifiable on your models (no extend needed). And you can also use classify
or classify! methods to do the classification and store or persist the result.

When your classification doesn't fit in one model, you can also create a folder on ```app/classifications```, from there
you can mix a lot of different models, and store the result on a model even more different. Try it your self. ;)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/clever/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
