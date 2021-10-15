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

    def initialize
      # gtk_constraint_guide_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_constraint_guide_new
      @pointer = _retval
    end

    def max_size(width : Pointer(Int32)?, height : Pointer(Int32)?) : Nil
      # gtk_constraint_guide_get_max_size: (Method)
      # @width: (nullable)
      # @height: (nullable)
      # Returns: (transfer none)

      width = if width.nil?
                Pointer(Int32).null
              else
                width.to_unsafe
              end
      height = if height.nil?
                 Pointer(Int32).null
               else
                 height.to_unsafe
               end

      LibGtk.gtk_constraint_guide_get_max_size(self, width, height)
    end

    def min_size(width : Pointer(Int32)?, height : Pointer(Int32)?) : Nil
      # gtk_constraint_guide_get_min_size: (Method)
      # @width: (nullable)
      # @height: (nullable)
      # Returns: (transfer none)

      width = if width.nil?
                Pointer(Int32).null
              else
                width.to_unsafe
              end
      height = if height.nil?
                 Pointer(Int32).null
               else
                 height.to_unsafe
               end

      LibGtk.gtk_constraint_guide_get_min_size(self, width, height)
    end

    def name : ::String?
      # gtk_constraint_guide_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_guide_get_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def nat_size(width : Pointer(Int32)?, height : Pointer(Int32)?) : Nil
      # gtk_constraint_guide_get_nat_size: (Method)
      # @width: (nullable)
      # @height: (nullable)
      # Returns: (transfer none)

      width = if width.nil?
                Pointer(Int32).null
              else
                width.to_unsafe
              end
      height = if height.nil?
                 Pointer(Int32).null
               else
                 height.to_unsafe
               end

      LibGtk.gtk_constraint_guide_get_nat_size(self, width, height)
    end

    def strength : Gtk::ConstraintStrength
      # gtk_constraint_guide_get_strength: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_guide_get_strength(self)
      Gtk::ConstraintStrength.from_value(_retval)
    end

    def set_max_size(width : Int32, height : Int32) : Nil
      # gtk_constraint_guide_set_max_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_constraint_guide_set_max_size(self, width, height)
    end

    def set_min_size(width : Int32, height : Int32) : Nil
      # gtk_constraint_guide_set_min_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_constraint_guide_set_min_size(self, width, height)
    end

    def name=(name : ::String?) : Nil
      # gtk_constraint_guide_set_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      LibGtk.gtk_constraint_guide_set_name(self, name)
    end

    def set_nat_size(width : Int32, height : Int32) : Nil
      # gtk_constraint_guide_set_nat_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_constraint_guide_set_nat_size(self, width, height)
    end

    def strength=(strength : Gtk::ConstraintStrength) : Nil
      # gtk_constraint_guide_set_strength: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_constraint_guide_set_strength(self, strength)
    end
  end
end
