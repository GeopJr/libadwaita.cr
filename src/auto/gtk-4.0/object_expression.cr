require "./expression"

module Gtk
  # A `GObject` value in a `GtkExpression`.
  @[GObject::GeneratedWrapper]
  class ObjectExpression < Expression
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ObjectExpression, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ObjectExpression`.
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
      LibGtk.gtk_object_expression_get_type
    end

    # Creates an expression evaluating to the given `object` with a weak reference.
    #
    # Once the `object` is disposed, it will fail to evaluate.
    #
    # This expression is meant to break reference cycles.
    #
    # If you want to keep a reference to `object`, use `Gtk::ConstantExpression.new`.
    def self.new(object : GObject::Object) : self
      # gtk_object_expression_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_object_expression_new(object)

      # Return value handling

      Gtk::ObjectExpression.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the object that the expression evaluates to.
    def object : GObject::Object?
      # gtk_object_expression_get_object: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_object_expression_get_object(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
