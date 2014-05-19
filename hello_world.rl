%%{
  machine params_parser;
  action H { @head = p }
  action T { @tail = p }
  action inject_key { @hash[key] = {} }

  EOL = ('\n' | '\r\n');
  DELIMITER = ([, ])+                            >H@T @{ log_event(:delimiter) };
  LEVEL = [(]                                    >H@T @{ log_event(:level) };
  END_LEVEL = [)]                                >H@T @{ log_event(:end_level) };
  INPUT = (any - LEVEL - END_LEVEL - DELIMITER)+ >H@T @{ log_event(:input); memo_key; };

  main := (
    INPUT?
    (DELIMITER @{ fnext main; } | LEVEL @{ @hash[key] = {}; @parent = @hash; @hash = @hash[key]; fcall nested; })
  )*;

  nested := (
    INPUT
    (DELIMITER @{ @hash[key] = {}; fnext nested; } | END_LEVEL @{ @hash[key] = {}; @hash = @parent; fret; })
  );
}%%

module ParamsTree
  class Parser
    attr_accessor :data

    def initialize
      @events = []
      @hash = {}
      @parent = {}
      @key = nil
      %% write data;
    end

    def process(input)
      @data = input.unpack('c*')
      stack = []

      %% write init;
      %% write exec;

      puts @events.inspect
      puts key
      puts @hash.inspect
      puts @parent.inspect
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

ParamsTree::Parser.new.process "default(all,usadasdid),isdsdd(wow,er),sed(rew,tre,yrt)"
