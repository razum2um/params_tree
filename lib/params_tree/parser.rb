
# line 1 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"

# line 22 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"


module ParamsTree
  class Parser
    attr_accessor :data

    def initialize
      
# line 14 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rb"
class << self
	attr_accessor :_params_tree_actions
	private :_params_tree_actions, :_params_tree_actions=
end
self._params_tree_actions = [
	0, 2, 1, 7, 2, 1, 8, 3, 
	0, 1, 7, 3, 0, 1, 8, 5, 
	0, 1, 5, 2, 9, 6, 0, 1, 
	5, 2, 4, 10, 6, 0, 1, 6, 
	2, 3, 11
]

class << self
	attr_accessor :_params_tree_key_offsets
	private :_params_tree_key_offsets, :_params_tree_key_offsets=
end
self._params_tree_key_offsets = [
	0, 0, 3, 6
]

class << self
	attr_accessor :_params_tree_trans_keys
	private :_params_tree_trans_keys, :_params_tree_trans_keys=
end
self._params_tree_trans_keys = [
	40, 41, 44, 44, 40, 41, 40, 41, 
	44, 0
]

class << self
	attr_accessor :_params_tree_single_lengths
	private :_params_tree_single_lengths, :_params_tree_single_lengths=
end
self._params_tree_single_lengths = [
	0, 3, 1, 3
]

class << self
	attr_accessor :_params_tree_range_lengths
	private :_params_tree_range_lengths, :_params_tree_range_lengths=
end
self._params_tree_range_lengths = [
	0, 0, 1, 0
]

class << self
	attr_accessor :_params_tree_index_offsets
	private :_params_tree_index_offsets, :_params_tree_index_offsets=
end
self._params_tree_index_offsets = [
	0, 0, 4, 7
]

class << self
	attr_accessor :_params_tree_trans_targs
	private :_params_tree_trans_targs, :_params_tree_trans_targs=
end
self._params_tree_trans_targs = [
	2, 3, 2, 1, 0, 0, 1, 0, 
	3, 2, 1, 0
]

class << self
	attr_accessor :_params_tree_trans_actions
	private :_params_tree_trans_actions, :_params_tree_trans_actions=
end
self._params_tree_trans_actions = [
	28, 7, 15, 4, 0, 0, 11, 0, 
	1, 21, 11, 0
]

class << self
	attr_accessor :params_tree_start
end
self.params_tree_start = 2;
class << self
	attr_accessor :params_tree_first_final
end
self.params_tree_first_final = 2;
class << self
	attr_accessor :params_tree_error
end
self.params_tree_error = 0;

class << self
	attr_accessor :params_tree_en_main
end
self.params_tree_en_main = 2;


# line 30 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
    end

    def parse(input)
      input = input.gsub(/\s*/, '')
      return {} if input.size == 0
      @data = input.unpack('c*')
      stack = []

      @log = []
      @hash = {}
      @hash_stack = []
      @key = nil

      
# line 120 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = params_tree_start
	top = 0
end

# line 44 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
      
# line 130 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _params_tree_key_offsets[cs]
	_trans = _params_tree_index_offsets[cs]
	_klen = _params_tree_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _params_tree_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _params_tree_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _params_tree_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _params_tree_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _params_tree_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	cs = _params_tree_trans_targs[_trans]
	if _params_tree_trans_actions[_trans] != 0
		_acts = _params_tree_trans_actions[_trans]
		_nacts = _params_tree_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _params_tree_actions[_acts - 1]
when 0 then
# line 3 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 @head = p 		end
when 1 then
# line 4 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 @tail = p 		end
when 2 then
# line 5 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 inject_key 		end
when 3 then
# line 6 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 push 		end
when 4 then
# line 7 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 pop 		end
when 5 then
# line 9 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 log(:delimiter) 		end
when 6 then
# line 10 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 log(:level) 		end
when 7 then
# line 11 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 log(:end_level); 		end
when 8 then
# line 12 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 log(:input); memo_key; 		end
when 9 then
# line 17 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 cs = 2; 		end
when 10 then
# line 18 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 	begin
		top -= 1
		cs = stack[top]
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
when 11 then
# line 19 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 2
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
# line 273 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 45 "/Users/razum2um/Code/params_tree/lib/params_tree/parser.rl"

      inject_key # FIXME

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
