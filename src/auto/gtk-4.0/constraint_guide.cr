require "../g_object-2.0/object"
require "./constraint_target"

module Gtk
  # A `GtkConstraintGuide` is an invisible layout element in a
  # `GtkConstraintLayout`.
  #
  # The `GtkConstraintLayout` treats guides like widgets. They
  # can be used as the source or target of a `GtkConstraint`.
  #
  # Guides have a minimum, maximum and natural size. Depending
  # on the constraints that are applied, they can act like a
  # guideline that widgets can be aligned to, or like *flexible
  # space*.
  #
  # Unlike a `GtkWidget`, a `GtkConstraintGuide` will not be drawn.
  class ConstraintGuide < GObject::Object
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, max_height : Int32? = nil, max_width : Int32? = nil, min_height : Int32? = nil, min_width : Int32? = nil, name : ::String? = nil, nat_height : Int32? = nil, nat_width : Int32? = nil, strength : Gtk::ConstraintStrength? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if max_height
        (_names.to_unsafe + _n).value = "max-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_height)
        _n += 1
      end
      if max_width
        (_names.to_unsafe + _n).value = "max-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width)
        _n += 1
      end
      if min_height
        (_names.to_unsafe + _n).value = "min-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_height)
        _n += 1
      end
      if min_width
        (_names.to_unsafe + _n).value = "min-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_width)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if nat_height
        (_names.to_unsafe + _n).value = "nat-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, nat_height)
        _n += 1
      end
      if nat_width
        (_names.to_unsafe + _n).value = "nat-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, nat_width)
        _n += 1
      end
      if strength
        (_names.to_unsafe + _n).value = "strength".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strength)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ConstraintGuide.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_constraint_guide_get_type
    end

    def max_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-height", unsafe_value, Pointer(Void).null)
      value
    end

    def max_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-height", pointerof(value), Pointer(Void).null)
      value
    end

    def max_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-width", unsafe_value, Pointer(Void).null)
      value
    end

    def max_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-width", pointerof(value), Pointer(Void).null)
      value
    end

    def min_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-height", unsafe_value, Pointer(Void).null)
      value
    end

    def min_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "min-height", pointerof(value), Pointer(Void).null)
      value
    end

    def min_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-width", unsafe_value, Pointer(Void).null)
      value
    end

    def min_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "min-width", pointerof(value), Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def nat_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "nat-height", unsafe_value, Pointer(Void).null)
      value
    end

    def nat_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "nat-height", pointerof(value), Pointer(Void).null)
      value
    end

    def nat_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "nat-width", unsafe_value, Pointer(Void).null)
      value
    end

    def nat_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "nat-width", pointerof(value), Pointer(Void).null)
      value
    end

    def strength=(value : Gtk::ConstraintStrength) : Gtk::ConstraintStrength
      unsafe_value = value

      LibGObject.g_object_set(self, "strength", unsafe_value, Pointer(Void).null)
      value
    end

    def strength : Gtk::ConstraintStrength
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "strength", pointerof(value), Pointer(Void).null)
      Gtk::ConstraintStrength.from_value(value)
    end

    def initialize
      # gtk_constraint_guide_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_constraint_guide_new

      # Return value handling
      @pointer = _retval
    end

    def max_size : Nil
      # gtk_constraint_guide_get_max_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_constraint_guide_get_max_size(self, width, height)

      # Return value handling
    end

    def min_size : Nil
      # gtk_constraint_guide_get_min_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_constraint_guide_get_min_size(self, width, height)

      # Return value handling
    end

    def name : ::String?
      # gtk_constraint_guide_get_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_constraint_guide_get_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def nat_size : Nil
      # gtk_constraint_guide_get_nat_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_constraint_guide_get_nat_size(self, width, height)

      # Return value handling
    end

    def strength : Gtk::ConstraintStrength
      # gtk_constraint_guide_get_strength: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_constraint_guide_get_strength(self)

      # Return value handling
      Gtk::ConstraintStrength.from_value(_retval)
    end

    def set_max_size(width : Int32, height : Int32) : Nil
      # gtk_constraint_guide_set_max_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_guide_set_max_size(self, width, height)

      # Return value handling
    end

    def set_min_size(width : Int32, height : Int32) : Nil
      # gtk_constraint_guide_set_min_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_guide_set_min_size(self, width, height)

      # Return value handling
    end

    def name=(name : ::String?) : Nil
      # gtk_constraint_guide_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_constraint_guide_set_name(self, name)

      # Return value handling
    end

    def set_nat_size(width : Int32, height : Int32) : Nil
      # gtk_constraint_guide_set_nat_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_guide_set_nat_size(self, width, height)

      # Return value handling
    end

    def strength=(strength : Gtk::ConstraintStrength) : Nil
      # gtk_constraint_guide_set_strength: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_guide_set_strength(self, strength)

      # Return value handling
    end
  end
end
