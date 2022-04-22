require "./expression"

module Gtk
  # A `GObject` value in a `GtkExpression`.
  @[GObject::GeneratedWrapper]
  class ObjectExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::ObjectExpression), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_object_expression_get_type
    end

    # Creates an expression evaluating to the given `object` with a weak reference.
    #
    # Once the `object` is disposed, it will fail to evaluate.
    #
    # This expression is meant to break reference cycles.
    #
    # If you want to keep a reference to `object`, use `Gtk::ConstantExpression.new`.
    def initialize(object : GObject::Object)
      # gtk_object_expression_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_object_expression_new(object)

      # Return value handling

      @pointer = _retval
    end

    # Gets the object that the expression evaluates to.
    def object : GObject::Object?
      # gtk_object_expression_get_object: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_object_expression_get_object(self)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
