module Gtk
  # Struct defining a pad action entry.
  class PadActionEntry
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::PadActionEntry))
      @pointer.copy_from(pointer, sizeof(LibGtk::PadActionEntry))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(type : Gtk::PadActionType? = nil, index : Int32? = nil, mode : Int32? = nil, label : ::String? = nil, action_name : ::String? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.type = type unless type.nil?
      _instance.index = index unless index.nil?
      _instance.mode = mode unless mode.nil?
      _instance.label = label unless label.nil?
      _instance.action_name = action_name unless action_name.nil?
      _instance
    end

    def finalize
    end

    def type : Gtk::PadActionType
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      Gtk::PadActionType.from_value(_var.value)
    end

    def type=(value : Gtk::PadActionType)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def index : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def index=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def mode : Int32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def mode=(value : Int32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def label : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def label=(value : ::String)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def action_name : ::String
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def action_name=(value : ::String)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
