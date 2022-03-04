module Gtk
  # A range of pages to print.
  #
  # See also [method@Gtk.PrintSettings.set_page_ranges].
  class PageRange
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::PageRange))
      @pointer.copy_from(pointer, sizeof(LibGtk::PageRange))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(start : Int32? = nil, end _end : Int32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.start = start unless start.nil?
      _instance.end = _end unless _end.nil?
      _instance
    end

    def finalize
    end

    def start : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def start=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def end : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def end=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
