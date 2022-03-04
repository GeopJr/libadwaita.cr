require "./filter"

module Gtk
  # `GtkBoolFilter` evaluates a boolean `GtkExpression`
  # to determine whether to include items.
  class BoolFilter < Filter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, expression : Gtk::Expression? = nil, invert : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if expression
        (_names.to_unsafe + _n).value = "expression".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expression)
        _n += 1
      end
      if invert
        (_names.to_unsafe + _n).value = "invert".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invert)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BoolFilter.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_bool_filter_get_type
    end

    def expression=(value : Gtk::Expression?) : Gtk::Expression?
      unsafe_value = value

      LibGObject.g_object_set(self, "expression", unsafe_value, Pointer(Void).null)
      value
    end

    def expression : Gtk::Expression?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "expression", pointerof(value), Pointer(Void).null)
      Gtk::Expression.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def invert=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "invert", unsafe_value, Pointer(Void).null)
      value
    end

    def invert? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "invert", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(expression : Gtk::Expression?)
      # gtk_bool_filter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      # Handle parameters
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      LibGObject.g_object_ref(expression)

      # C call
      _retval = LibGtk.gtk_bool_filter_new(expression)

      # Return value handling
      @pointer = _retval
    end

    def expression : Gtk::Expression?
      # gtk_bool_filter_get_expression: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_bool_filter_get_expression(self)

      # Return value handling
      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def invert : Bool
      # gtk_bool_filter_get_invert: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_bool_filter_get_invert(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_bool_filter_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # C call
      LibGtk.gtk_bool_filter_set_expression(self, expression)

      # Return value handling
    end

    def invert=(invert : Bool) : Nil
      # gtk_bool_filter_set_invert: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_bool_filter_set_invert(self, invert)

      # Return value handling
    end
  end
end
