require "./expression"

module Gtk
  # A variant of `GtkClosureExpression` using a C closure.
  class CClosureExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cclosure_expression_get_type
    end

    def initialize(value_type : UInt64, marshal : Pointer(Void)?, params : Enumerable(Gtk::Expression), callback_func : Pointer(Void), user_data : Pointer(Nil)?, user_destroy : Pointer(Void)?)
      # gtk_cclosure_expression_new: (Constructor)
      # @marshal: (nullable)
      # @params: (transfer full) (array length=n_params element-type Interface)
      # @user_data: (nullable)
      # @user_destroy: (nullable)
      # Returns: (transfer full)

      n_params = params.size
      marshal = if marshal.nil?
                  LibGObject::ClosureMarshal.null
                else
                  marshal.to_unsafe
                end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      user_destroy = if user_destroy.nil?
                       LibGObject::ClosureNotify.null
                     else
                       user_destroy.to_unsafe
                     end
      params = params.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGtk.gtk_cclosure_expression_new(value_type, marshal, n_params, params, callback_func, user_data, user_destroy)
      @pointer = _retval
    end
  end
end
