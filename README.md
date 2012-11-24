# Googlon Scroll Programming Quiz Generator

This gem provides a seed-based programming quiz generator similar to the ones
given by Google as part of the registration process for Google Developer Day
2011.


## Installation

If you plan to use it in some application, just add this line to your
application's Gemfile:

````ruby

gem 'googlon-scroll'
````

And then execute:

````bash

$ bundle
````

Or install it yourself as:

````bash

$ gem install googlon-scroll
````

## Usage

The first thing is to require the gem's module:

````ruby

require 'googlon-scroll'
````

Then, you can create a new instance of `GooglonScroll::Quiz` and
start generating the scroll texts along with the answer to each
question:

````ruby

GooglonScroll::Quiz.new do |c|
  c.seed # Seed used to generate the scrolls

  # Scroll text generation
  text_a = c.generate_scroll_text!
  text_b = c.generate_scroll_text! 3000   # Number of words in the text

  # Prepositions
  c.count_prepositions_in text_a

  # Verbs
  c.count_verbs_in text_a
  c.count_subjunctive_verbs_in text_a

  # Vocabulary list
  c.vocabulary_list_from text_a

  # Pretty numbers
  c.count_distinct_pretty_numbers_in text_a
end
````

To specify your own seed to the quiz generator:

````ruby

c = GooglonScroll::Quiz.new 1234567890
````


## License

Distributed under the BSD License. See LICENSE/COPYRIGHT for further details.
