module Gtk
  # A `GtkRequisition` represents the desired size of a widget. See
  # [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
  # more information.
  class Requisition
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::Requisition))
      @pointer.copy_from(pointer, sizeof(LibGtk::Requisition))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(width : Int32? = nil, height : Int32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.width = width unless width.nil?
      _instance.height = height unless height.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::Requisition)).zero?
    end

    def width : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def width=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def height : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def height=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_requisition_get_type
    end

    def initialize
      # gtk_requisition_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_requisition_new

      # Return value handling

      @pointer = _retval
    end

    def copy : Gtk::Requisition
      # gtk_requisition_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_requisition_copy(self)

      # Return value handling

      Gtk::Requisition.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_requisition_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_requisition_free(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
