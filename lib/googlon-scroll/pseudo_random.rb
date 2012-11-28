module GooglonScroll
  module PseudoRandom
    def new_random
      @random = Random.new @seed
    end

    def random
      @random ||= new_random
    end
  end
end
