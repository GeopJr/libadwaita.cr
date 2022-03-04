require "./expression"

module Gtk
  # A `GObject` property value in a `GtkExpression`.
  class PropertyExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_property_expression_get_type
    end

    def initialize(this_type : UInt64, expression : Gtk::Expression?, property_name : ::String)
      # gtk_property_expression_new: (Constructor)
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
      _retval = LibGtk.gtk_property_expression_new(this_type, expression, property_name)

      # Return value handling
      @pointer = _retval
    end

    def self.new_for_pspec(expression : Gtk::Expression?, pspec : GObject::ParamSpec) : self
      # gtk_property_expression_new_for_pspec: (Constructor)
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
      _retval = LibGtk.gtk_property_expression_new_for_pspec(expression, pspec)

      # Return value handling
      Gtk::PropertyExpression.new(_retval, GICrystal::Transfer::Full)
    end

    def expression : Gtk::Expression
      # gtk_property_expression_get_expression: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_property_expression_get_expression(self)

      # Return value handling
      Gtk::Expression.new(_retval, GICrystal::Transfer::None)
    end

    def pspec : GObject::ParamSpec
      # gtk_property_expression_get_pspec: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_property_expression_get_pspec(self)

      # Return value handling
      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None)
    end
  end
end
