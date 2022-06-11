require "./expression"

module Gtk
  # A `GObject` property value in a `GtkExpression`.
  @[GObject::GeneratedWrapper]
  class PropertyExpression < Expression
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(PropertyExpression, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PropertyExpression`.
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
      LibGtk.gtk_property_expression_get_type
    end

    # Creates an expression that looks up a property.
    #
    # The object to use is found by evaluating the `expression`,
    # or using the `this` argument when `expression` is `NULL`.
    #
    # If the resulting object conforms to `this_type`, its property named
    # `property_name` will be queried. Otherwise, this expression's
    # evaluation will fail.
    #
    # The given `this_type` must have a property with `property_name`.
    def self.new(this_type : UInt64, expression : Gtk::Expression?, property_name : ::String) : self
      # gtk_property_expression_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      # Generator::TransferFullArgPlan
      LibGObject.gtk_expression_ref(expression)
      # C call
      _retval = LibGtk.gtk_property_expression_new(this_type, expression, property_name)

      # Return value handling

      Gtk::PropertyExpression.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates an expression that looks up a property.
    #
    # The object to use is found by evaluating the `expression`,
    # or using the `this` argument when `expression` is `NULL`.
    #
    # If the resulting object conforms to `this_type`, its
    # property specified by `pspec` will be queried.
    # Otherwise, this expression's evaluation will fail.
    def self.new_for_pspec(expression : Gtk::Expression?, pspec : GObject::ParamSpec) : self
      # gtk_property_expression_new_for_pspec: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      # Generator::TransferFullArgPlan
      LibGObject.gtk_expression_ref(expression)
      # C call
      _retval = LibGtk.gtk_property_expression_new_for_pspec(expression, pspec)

      # Return value handling

      Gtk::PropertyExpression.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the expression specifying the object of
    # a property expression.
    def expression : Gtk::Expression?
      # gtk_property_expression_get_expression: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_property_expression_get_expression(@pointer)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GParamSpec` specifying the property of
    # a property expression.
    def pspec : GObject::ParamSpec
      # gtk_property_expression_get_pspec: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_property_expression_get_pspec(@pointer)

      # Return value handling

      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None)
    end
  end
end
