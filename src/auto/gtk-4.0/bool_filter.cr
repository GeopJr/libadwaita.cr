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

    def initialize(expression : Gtk::Expression?)
      # gtk_bool_filter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      LibGObject.g_object_ref(expression)

      _retval = LibGtk.gtk_bool_filter_new(expression)
      @pointer = _retval
    end

    def expression : Gtk::Expression?
      # gtk_bool_filter_get_expression: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bool_filter_get_expression(self)
      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def invert? : Bool
      # gtk_bool_filter_get_invert: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bool_filter_get_invert(self)
      GICrystal.to_bool(_retval)
    end

    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_bool_filter_set_expression: (Method)
      # @expression: (nullable)
      # Returns: (transfer none)

      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      LibGtk.gtk_bool_filter_set_expression(self, expression)
    end

    def invert=(invert : Bool) : Nil
      # gtk_bool_filter_set_invert: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bool_filter_set_invert(self, invert)
    end
  end
end
