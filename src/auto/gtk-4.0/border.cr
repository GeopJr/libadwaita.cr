module Gtk
  # A struct that specifies a border around a rectangular area.
  #
  # Each side can have different width.
  class Border
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::Border))
      @pointer.copy_from(pointer, sizeof(LibGtk::Border))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(left : Int16? = nil, right : Int16? = nil, top : Int16? = nil, bottom : Int16? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.left = left unless left.nil?
      _instance.right = right unless right.nil?
      _instance.top = top unless top.nil?
      _instance.bottom = bottom unless bottom.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::Border)).zero?
    end

    def left : Int16
      _var = (@pointer + 0).as(Pointer(Int16))
      _var.value
    end

    def left=(value : Int16)
      _var = (@pointer + 0).as(Pointer(Int16)).value = value
      value
    end

    def right : Int16
      _var = (@pointer + 2).as(Pointer(Int16))
      _var.value
    end

    def right=(value : Int16)
      _var = (@pointer + 2).as(Pointer(Int16)).value = value
      value
    end

    def top : Int16
      _var = (@pointer + 4).as(Pointer(Int16))
      _var.value
    end

    def top=(value : Int16)
      _var = (@pointer + 4).as(Pointer(Int16)).value = value
      value
    end

    def bottom : Int16
      _var = (@pointer + 6).as(Pointer(Int16))
      _var.value
    end

    def bottom=(value : Int16)
      _var = (@pointer + 6).as(Pointer(Int16)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_border_get_type
    end

    def initialize
      # gtk_border_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_border_new

      # Return value handling

      @pointer = _retval
    end

    def copy : Gtk::Border
      # gtk_border_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_border_copy(self)

      # Return value handling

      Gtk::Border.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_border_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_border_free(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
