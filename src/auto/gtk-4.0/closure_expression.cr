require "./expression"

module Gtk
  # An expression using a custom `GClosure` to compute the value from
  # its parameters.
  @[GObject::GeneratedWrapper]
  class ClosureExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::ClosureExpression), instance_init, 0)
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
      LibGtk.gtk_closure_expression_get_type
    end

    # Creates a `GtkExpression` that calls `closure` when it is evaluated.
    #
    # `closure` is called with the `this` object and the results of evaluating
    # the `params` expressions.
    def initialize(value_type : UInt64, closure : GObject::Closure, params : Enumerable(Gtk::Expression)?)
      # gtk_closure_expression_new: (Constructor)
      # @params: (transfer full) (nullable) (array length=n_params element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_params = params.try(&.size) || 0 # Generator::NullableArrayPlan
      params = if params.nil?
                 Pointer(Pointer(Void)).null
               else
                 params.to_a.map(&.to_unsafe).to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_closure_expression_new(value_type, closure, n_params, params)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
