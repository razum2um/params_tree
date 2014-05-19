%%{
  machine params_parser;
  action H { @head = p }
  action T { @tail = p }
  action inject_key { @hash[key] = {} }
  action push { @hash_stack.push @hash; @hash = @hash[key] }
  action pop { @hash = @hash_stack.pop }

  DELIMITER = ([, ])                                >H@T @{ log(:delimiter) };
  LEVEL = ('(')+                                    >H@T @{ log(:level) };
  END_LEVEL = (')')+                                >H@T @{ log(:end_level); };
  INPUT = (any - LEVEL - END_LEVEL - DELIMITER)+    >H@T @{ log(:input); memo_key; };

  main := (
    INPUT
    (
      DELIMITER @inject_key @{ fnext main; } |
      END_LEVEL DELIMITER? @inject_key @pop @{ fret; } |
      LEVEL @inject_key @push @{ fcall main; }
    )
  )*;
}%%

module ParamsTree
  class Parser
    attr_accessor :data

    def initialize
      %% write data;
    end

    def process(input)
      @data = input.unpack('c*')
      stack = []

      @log = []
      @hash = {}
      @hash_stack = []
      @key = nil

      %% write init;
      %% write exec;

      #@hash.inspect
      #@hash_stack.inspect
      @hash_stack.first
    end

    def char
      @data[@head..@tail]
    end

    def strokes
      char.pack('c*')
    end

    def log(token)
      @log << { token => strokes }
    end

    def memo_key
      @key = char
    end

    def key
      @key.pack('c*')
    end
  end
end

s = "default(all,usadasdid(zczxc(pio(xqwe)),cvb)),isdsdd(wow,er),sed(rew,tre,yrt(dfg,gfd))"
puts s
puts ParamsTree::Parser.new.process s
