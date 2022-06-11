require "./expression"

module Gtk
  # A variant of `GtkClosureExpression` using a C closure.
  @[GObject::GeneratedWrapper]
  class CClosureExpression < Expression
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(CClosureExpression, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CClosureExpression`.
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
      LibGtk.gtk_cclosure_expression_get_type
    end

    # Creates a `GtkExpression` that calls `callback_func` when it is evaluated.
    #
    # This function is a variant of `Gtk::ClosureExpression.new` that
    # creates a `GClosure` by calling g_cclosure_new() with the given
    # `callback_func`, `user_data` and `user_destroy`.
    def self.new(value_type : UInt64, marshal : GObject::ClosureMarshal?, params : Enumerable(Gtk::Expression), callback_func : GObject::Callback, user_data : Pointer(Void)?, user_destroy : GObject::ClosureNotify?) : self
      # gtk_cclosure_expression_new: (Constructor)
      # @marshal: (nullable)
      # @params: (transfer full) (array length=n_params element-type Interface)
      # @user_data: (nullable)
      # @user_destroy: (nullable)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_params = params.size # Generator::ArrayArgPlan
      params = params.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_cclosure_expression_new(value_type, marshal, n_params, params, callback_func, user_data, user_destroy)

      # Return value handling

      Gtk::CClosureExpression.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
