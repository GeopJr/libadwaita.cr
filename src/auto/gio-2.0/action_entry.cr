module Gio
  # This struct defines a single action.  It is for use with
  # g_action_map_add_action_entries().
  #
  # The order of the items in the structure are intended to reflect
  # frequency of use.  It is permissible to use an incomplete initialiser
  # in order to leave some of the later values as %NULL.  All values
  # after @name are optional.  Additional optional fields may be added in
  # the future.
  #
  # See g_action_map_add_action_entries() for an example.
  class ActionEntry
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::ActionEntry))
      @pointer.copy_from(pointer, sizeof(LibGio::ActionEntry))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(name : ::String? = nil, activate : Pointer(Void)? = nil, parameter_type : ::String? = nil, state : ::String? = nil, change_state : Pointer(Void)? = nil, padding : Enumerable(UInt64)? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.name = name unless name.nil?
      _instance.activate = activate unless activate.nil?
      _instance.parameter_type = parameter_type unless parameter_type.nil?
      _instance.state = state unless state.nil?
      _instance.change_state = change_state unless change_state.nil?
      _instance.padding = padding unless padding.nil?
      _instance
    end

    def finalize
    end

    def name : ::String
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def name=(value : ::String)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def activate : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def activate=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def parameter_type : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def parameter_type=(value : ::String)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def state : ::String
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def state=(value : ::String)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def change_state : Pointer(Void)
      # Property getter
      _var = (@pointer + 32).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def change_state=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 32).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def padding : Enumerable(UInt64)
      # Property getter
      _var = (@pointer + 40).as(Pointer(UInt64[3]))
      _var.value
    end

    def padding=(value : Enumerable(UInt64))
      # Property setter
      _var = (@pointer + 40).as(Pointer(UInt64[3])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
