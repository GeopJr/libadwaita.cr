require "./filter"

module Gtk
  # `GtkCustomFilter` determines whether to include items with a callback.
  class CustomFilter < Filter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_custom_filter_get_type
    end

    def initialize(match_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_destroy : Pointer(Void))
      # gtk_custom_filter_new: (Constructor)
      # @match_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      match_func = if match_func.nil?
                     LibGtk::CustomFilterFunc.null
                   else
                     match_func.to_unsafe
                   end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibGtk.gtk_custom_filter_new(match_func, user_data, user_destroy)
      @pointer = _retval
    end

    def set_filter_func(match_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_destroy : Pointer(Void)) : Nil
      # gtk_custom_filter_set_filter_func: (Method)
      # @match_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      match_func = if match_func.nil?
                     LibGtk::CustomFilterFunc.null
                   else
                     match_func.to_unsafe
                   end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_custom_filter_set_filter_func(self, match_func, user_data, user_destroy)
    end
  end
end
