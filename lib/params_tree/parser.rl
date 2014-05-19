%%{
  machine params_tree;
  action H { @head = p }
  action T { @tail = p }
  action inject_key { inject_key }
  action push { push }
  action pop { pop }

  DELIMITER = ','                                   >H@T @{ log(:delimiter) };
  LEVEL = '('                                       >H@T @{ log(:level) };
  END_LEVEL = ')'+                                  >H@T @{ log(:end_level); };
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

    def parse(input)
      @data = input.gsub(/[^a-zA-Z,\(\)]/, '').unpack('c*')
      stack = []

      @log = []
      @hash = {}
      @hash_stack = []
      @key = nil

      %% write init;
      %% write exec;

      inject_key # FIXME

      #puts key
      #puts @hash.inspect
      #puts @hash_stack.inspect

      @hash_stack.first || @hash
    end

    def chars
      @data[@head..@tail]
    end

    def strokes
      chars.pack('c*')
    end

    def log(token)
      @log << { token => strokes }
    end

    def memo_key
      @key = chars
    end

    def key
      @key.pack('c*')
    end

    def inject_key
      @hash[key] = {}
    end

    def push
      @hash_stack.push @hash; @hash = @hash[key]
    end

    def pop
      @hash = @hash_stack.pop
    end

    def self.parse(string)
      self.new.parse(string)
    end
  end
end

s = "default(all,usadasdid(zczxc(pio(xqwe)),cvb)),isdsdd(wow,er),sed(rew,tre,yrt(dfg,gfd))"
#s = "default,all"
#s = "default(id,op),all"
puts s
puts ParamsTree::Parser.parse s
