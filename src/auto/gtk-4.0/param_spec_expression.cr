require "../g_object-2.0/param_spec"

module Gtk
  # A `GParamSpec` for properties holding a `GtkExpression`.
  @[GObject::GeneratedWrapper]
  class ParamSpecExpression < GObject::ParamSpec
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::ParamSpecExpression), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_param_expression_get_type
    end
  end
end
