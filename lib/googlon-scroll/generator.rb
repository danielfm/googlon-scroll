module GooglonScroll
  class Generator
    attr_accessor :text_a, :text_b

    def initialize(seed)
      @quiz = Quiz.new(seed)

      @text_a = @quiz.generate_scroll_text!
      @text_b = @quiz.generate_scroll_text!
    end

    def text
      word = fist_word_from text_a

      @text ||= <<-EOF
Archeologists found a misterious scroll containing two texts:

Text A:

#{text_a}

Text B:

#{text_b}

These texts are in the ancient and mysterious Googlon language. After many
years of study, linguists have learned some of the fundamental characteristics
of this language.

First, the Googlon letters are classified in two groups: the letters
#{@quiz.letter.foo_letters.join ', '} are called "foo letters" while the other letters are called
"bar letters".

The linguists have discovered that in the Googlon language, the prepositions
are the words of exactly #{@quiz.preposition.word_length} letters which end in a #{@quiz.preposition.last_letter_group} letter and do not contain
the letter #{@quiz.preposition.invalid_letter}. Therefore, it is easy to see that there are #{@quiz.count_prepositions_in text_a} prepositions
in Text A.

QUESTION:
How many prepositions are there in Text B?

ANSWER:
There are #{@quiz.count_prepositions_in text_b} prepositions in Text B.

Another interesting fact discovered by linguists is that, in the Googlon
language, verbs are words of #{@quiz.verb.word_length} letters or more that end in a #{@quiz.verb.last_letter_group} letter.
Furthermore, if a verb starts in a #{@quiz.verb.first_letter_group} letter, then the verb is inflected in
its subjunctive form.

Thus, reading Text A, we can tell that there is a total of #{@quiz.count_verbs_in text_a} verbs in the
text of which #{@quiz.count_subjunctive_verbs_in text_a} are in the subjunctive form.

QUESTION:
How many verbs are there in Text B?

ANSWER:
There are #{@quiz.count_verbs_in text_b} verbs in Text B.

QUESTION:
How many of those verbs in Text B are in the subjunctive form?

ANSWER:
There are #{@quiz.count_subjunctive_verbs_in text_b} subjunctive verbs in Text B.

A college professor will use Texts A and B to teach Googlon to her students.
To help students understand the texts, she must prepare a vocabulary list for
each of them. A vocabulary list is an ordered list (without duplicates) of all
the words that occur in the text.

But how does alphabetical order work in Googlon? In Googlon, like in our
system, words are always ordered lexicographically, but the challenge is that
the order of the letters in the Googlon alphabet is different from ours. Their
alphabet, in order, is: #{@quiz.letter.alphabet.join ''}. So, when preparing these
vocabulary lists, the professor must respect the Googlon alphabetical order.

The professor prepared the vocabulary list for Text A:

#{@quiz.vocabulary_list_from text_a}

QUESTION:
Can you help the professor create the vocabulary list for text B?

ANSWER:
#{@quiz.vocabulary_list_from text_b}

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

As an exemple, the Googlon word #{word} represents the number #{@quiz.word.as_number word}.

Googlons consider a number to be pretty if it satisfies all of the following
properties:

- it is greater than or equal to #{@quiz.word.min_pretty_number}
- it is divisible by #{@quiz.word.pretty_number_divisor}

When we consider Text A as a list of numbers (that is, interpreting each word
as a number as per the rules we explained above), we notice that there
are #{@quiz.count_distinct_pretty_numbers_in text_a} distinct (caution!) pretty numbers.

QUESTION:
How many distinct pretty numbers are there in Text B?

ANSWER:
In Text B, there are #{@quiz.count_distinct_pretty_numbers_in text_b} distinct(!) pretty numbers.
EOF
    end

    private

    def first_word_from(text)
      text.match(/^([\S]+)/)[0]
    end
  end
end
