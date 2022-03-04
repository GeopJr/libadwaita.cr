require "./expression"

module Gtk
  # An expression using a custom `GClosure` to compute the value from
  # its parameters.
  class ClosureExpression < Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_closure_expression_get_type
    end

    def initialize(value_type : UInt64, closure : GObject::Closure, params : Enumerable(Gtk::Expression)?)
      # gtk_closure_expression_new: (Constructor)
      # @params: (transfer full) (nullable) (array length=n_params element-type Interface)
      # Returns: (transfer full)

      # Handle parameters
      n_params = params.try(&.size) || 0
      params = if params.nil?
                 Pointer(Pointer(Void)).null
               else
                 params.to_a.map(&.to_unsafe).to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_closure_expression_new(value_type, closure, n_params, params)

      # Return value handling
      @pointer = _retval
    end
  end
end
