require "./expression"

module Gtk
  # A `GObject` property value in a `GtkExpression`.
  @[GObject::GeneratedWrapper]
  class PropertyExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::PropertyExpression), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
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
    def initialize(this_type : UInt64, expression : Gtk::Expression?, property_name : ::String)
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

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      _retval = LibGtk.gtk_property_expression_get_expression(self)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GParamSpec` specifying the property of
    # a property expression.
    def pspec : GObject::ParamSpec
      # gtk_property_expression_get_pspec: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_property_expression_get_pspec(self)

      # Return value handling

      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None)
    end
  end
end
