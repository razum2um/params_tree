%%{
  machine params_parser;
  action H { @head = p }
  action T { @tail = p }
  action inject_key { @hash[key] = {} }

  DELIMITER = (([, ])+ | '\n')                      >H@T @{ log_event(:delimiter) };
  LEVEL = ('(')+                                    >H@T @{ log_event(:level) };
  END_LEVEL = (')')+                                >H@T @{ log_event(:end_level); p + 1 == pe and @hash[key] = {}; };
  INPUT = (any - LEVEL - END_LEVEL - DELIMITER)+    >H@T @{ log_event(:input); memo_key; };

  main := (
    INPUT
    (DELIMITER @{ @hash[key] = {}; fnext main; } | END_LEVEL DELIMITER @{ @hash[key] = {}; @hash = @hash_stack.pop; fret; } | LEVEL @{ @hash[key] = {}; @hash_stack.push @hash; @hash = @hash[key]; fcall main; })
  )*;
}%%

module ParamsTree
  class Parser
    attr_accessor :data

    def initialize
      @events = []
      @hash = {}
      @hash_stack = []
      @key = nil
      %% write data;
    end

    def process(input)
      @data = input.unpack('c*')
      stack = []

      %% write init;
      %% write exec;

      #puts @events.inspect
      puts @hash_stack.inspect
    end

    def char
      @data[@head..@tail]
    end

    def strokes
      char.pack('c*')
    end

    def log_event(token)
      @events << { token => strokes }
    end

    def memo_key
      @key = char
    end

    def key
      @key.pack('c*')
    end
  end
end

ParamsTree::Parser.new.process "default(all,usadasdid(zczxc(pio),cvb)),isdsdd(wow,er),sed(rew,tre,yrt)"
