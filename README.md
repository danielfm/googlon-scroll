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

Then, you can create a new instance of `GooglonScroll::Generator` and
get the quiz text by calling the `text` method:

````ruby
GooglonScroll::Generator.new(1234567890).text
````

It will output something like this:

    Archeologists found a misterious scroll containing two texts:

    Text A:

    < TEXT A >

    Text B:

    < TEXT B >

    These texts are in the ancient and mysterious Googlon language. After many
    years of study, linguists have learned some of the fundamental characteristics
    of this language.

    First, the Googlon letters are classified in two groups: the letters
    w, v, o, c, y, z are called "foo letters" while the other letters are called
    "bar letters".

    The linguists have discovered that in the Googlon language, the prepositions
    are the words of exactly 5 letters which end in a foo letter and do not contain
    the letter w. Therefore, it is easy to see that there are 109 prepositions
    in Text A.

    QUESTION:
    How many prepositions are there in Text B?

    ANSWER:
    There are 111 prepositions in Text B.

    Another interesting fact discovered by linguists is that, in the Googlon
    language, verbs are words of 7 letters or more that end in a bar letter.
    Furthermore, if a verb starts in a foo letter, then the verb is inflected in
    its subjunctive form.

    Thus, reading Text A, we can tell that there is a total of 1577 verbs in the
    text of which 495 are in the subjunctive form.

    QUESTION:
    How many verbs are there in Text B?

    ANSWER:
    There are 1570 verbs in Text B.

    QUESTION:
    How many of those verbs in Text B are in the subjunctive form?

    ANSWER:
    There are 482 subjunctive verbs in Text B.

    A college professor will use Texts A and B to teach Googlon to her students.
    To help students understand the texts, she must prepare a vocabulary list for
    each of them. A vocabulary list is an ordered list (without duplicates) of all
    the words that occur in the text.

    But how does alphabetical order work in Googlon? In Googlon, like in our
    system, words are always ordered lexicographically, but the challenge is that
    the order of the letters in the Googlon alphabet is different from ours. Their
    alphabet, in order, is: xvralowgkcunjtdebyzq. So, when preparing these
    vocabulary lists, the professor must respect the Googlon alphabetical order.

    The professor prepared the vocabulary list for Text A:

    < VOCABULARY LIST >

    QUESTION:
    Can you help the professor create the vocabulary list for text B?

    ANSWER:
    < VOCABULARY LIST >

    Not that words aren't fun, but one could ask: how do Googlons represent
    the numbers? Well, in Googlon, words also represent numbers given in base 20,
    where each letter is a digit. The digits are ordered from the least
    significant to the most significant, which is the opposite of our system.
    That is, the leftmost digit is the unit, the second digit is worth 20, the
    third one is worth 400, and so on and so forth. The values of the letters are
    given by the order they appear in the Googlon alphabet (which, as we saw, is
    ordered differently from our alphabet). That is, the first letter of the
    Googlon alphabet represents the digit 0, the second letter represents the
    digit 1, and the last one represents the digit 19.

    As an exemple, the Googlon word lndk represents the number 69824.

    Googlons consider a number to be pretty if it satisfies all of the following
    properties:

        - it is greater than or equal to 65725
        - it is divisible by 5

    When we consider Text A as a list of numbers (that is, interpreting each word
    as a number as per the rules we explained above), we notice that there
    are 728 distinct (caution!) pretty numbers.

    QUESTION:
    How many distinct pretty numbers are there in Text B?

    ANSWER:
    In Text B, there are 731 distinct(!) pretty numbers.


## License

Distributed under the BSD License. See LICENSE/COPYRIGHT for further details.
