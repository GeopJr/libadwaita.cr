require "./expression"

module Gtk
  # A constant value in a `GtkExpression`.
  class ConstantExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_constant_expression_get_type
    end

    def self.new_for_value(value : _) : Gtk::ConstantExpression
      # gtk_constant_expression_new_for_value: (Constructor)
      # Returns: (transfer full)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_constant_expression_new_for_value(value)
      Gtk::ConstantExpression.new(_retval, GICrystal::Transfer::Full)
    end

    def value : GObject::Value
      # gtk_constant_expression_get_value: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constant_expression_get_value(self)
      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end
  end
end
