require "../g_object-2.0/param_spec"

module Gtk
  # A `GParamSpec` for properties holding a `GtkExpression`.
  class ParamSpecExpression < GObject::ParamSpec
    @pointer : Pointer(Void)

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
