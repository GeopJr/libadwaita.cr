require "./expression"

module Gtk
  # A `GObject` value in a `GtkExpression`.
  class ObjectExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_object_expression_get_type
    end

    def initialize(object : GObject::Object)
      # gtk_object_expression_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_object_expression_new(object)

      # Return value handling
      @pointer = _retval
    end

    def object : GObject::Object?
      # gtk_object_expression_get_object: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_object_expression_get_object(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
