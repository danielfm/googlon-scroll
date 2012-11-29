module GooglonScroll
  module PseudoRandom
    def new_random(sub_seed=0)
      @random = Random.new @seed
      sub_seed.times { @random.rand } if sub_seed > 0
      @random
    end

    def random
      @random
    end
  end
end
