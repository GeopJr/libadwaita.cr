require "./expression"

module Gtk
  # A variant of `GtkClosureExpression` using a C closure.
  @[GObject::GeneratedWrapper]
  class CClosureExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::CClosureExpression), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cclosure_expression_get_type
    end

    # Creates a `GtkExpression` that calls `callback_func` when it is evaluated.
    #
    # This function is a variant of `Gtk::ClosureExpression.new` that
    # creates a `GClosure` by calling g_cclosure_new() with the given
    # `callback_func`, `user_data` and `user_destroy`.
    def initialize(value_type : UInt64, marshal : Pointer(Void)?, params : Enumerable(Gtk::Expression), callback_func : Pointer(Void), user_data : Pointer(Void)?, user_destroy : Pointer(Void)?)
      # gtk_cclosure_expression_new: (Constructor)
      # @marshal: (nullable)
      # @params: (transfer full) (array length=n_params element-type Interface)
      # @user_data: (nullable)
      # @user_destroy: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      marshal = if marshal.nil?
                  LibGObject::ClosureMarshal.null
                else
                  marshal.to_unsafe
                end

      # Generator::ArrayLengthArgPlan
      n_params = params.size
      # Generator::ArrayArgPlan
      params = params.to_a.map(&.to_unsafe).to_unsafe

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # Generator::NullableArrayPlan
      user_destroy = if user_destroy.nil?
                       LibGObject::ClosureNotify.null
                     else
                       user_destroy.to_unsafe
                     end

      # C call
      _retval = LibGtk.gtk_cclosure_expression_new(value_type, marshal, n_params, params, callback_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
    end
  end
end
