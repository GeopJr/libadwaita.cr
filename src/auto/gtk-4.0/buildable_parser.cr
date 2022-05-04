module Gtk
  # A sub-parser for `GtkBuildable` implementations.
  class BuildableParser
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::BuildableParser))
      @pointer.copy_from(pointer, sizeof(LibGtk::BuildableParser))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(start_element : Gtk::StartElement? = nil, end_element : Gtk::EndElement? = nil, text : Gtk::Text? = nil, error : Gtk::Error? = nil, padding : Enumerable(Pointer(Void))? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.start_element = start_element unless start_element.nil?
      _instance.end_element = end_element unless end_element.nil?
      _instance.text = text unless text.nil?
      _instance.error = error unless error.nil?
      _instance.padding = padding unless padding.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::BuildableParser)).zero?
    end

    def start_element : Gtk::StartElement
      _var = (@pointer + 0).as(Pointer(Void*))
      Gtk::StartElement.new(_var, GICrystal::Transfer::None)
    end

    def start_element=(value : Gtk::StartElement)
      _var = (@pointer + 0).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def end_element : Gtk::EndElement
      _var = (@pointer + 8).as(Pointer(Void*))
      Gtk::EndElement.new(_var, GICrystal::Transfer::None)
    end

    def end_element=(value : Gtk::EndElement)
      _var = (@pointer + 8).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def text : Gtk::Text
      _var = (@pointer + 16).as(Pointer(Void*))
      Gtk::Text.new(_var, GICrystal::Transfer::None)
    end

    def text=(value : Gtk::Text)
      _var = (@pointer + 16).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def error : Gtk::Error
      _var = (@pointer + 24).as(Pointer(Void*))
      Gtk::Error.new(_var, GICrystal::Transfer::None)
    end

    def error=(value : Gtk::Error)
      _var = (@pointer + 24).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def padding : Enumerable(Pointer(Void))
      _var = (@pointer + 32).as(Pointer(Pointer(Void)[4]))
      _var.value
    end

    def padding=(value : Enumerable(Pointer(Void)))
      _var = (@pointer + 32).as(Pointer(Pointer(Void)[4])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
