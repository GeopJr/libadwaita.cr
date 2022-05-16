require "./expression"

module Gtk
  # A constant value in a `GtkExpression`.
  @[GObject::GeneratedWrapper]
  class ConstantExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::ConstantExpression), instance_init, 0)
    end

    GICrystal.define_new_method(ConstantExpression, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ConstantExpression`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_constant_expression_get_type
    end

    # Creates an expression that always evaluates to the given `value`.
    def self.new_for_value(value : _) : self
      # gtk_constant_expression_new_for_value: (Constructor)
      # Returns: (transfer full)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_constant_expression_new_for_value(value)

      # Return value handling

      Gtk::ConstantExpression.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the value that a constant expression evaluates to.
    def value : GObject::Value
      # gtk_constant_expression_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constant_expression_get_value(@pointer)

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end
  end
end
