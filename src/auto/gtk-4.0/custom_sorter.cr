require "./sorter"

module Gtk
  # `GtkCustomSorter` is a `GtkSorter` implementation that sorts via a callback
  # function.
  class CustomSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_custom_sorter_get_type
    end

    def initialize(sort_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_destroy : Pointer(Void)?)
      # gtk_custom_sorter_new: (Constructor)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # @user_destroy: (nullable)
      # Returns: (transfer full)

      sort_func = if sort_func.nil?
                    LibGLib::CompareDataFunc.null
                  else
                    sort_func.to_unsafe
                  end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      user_destroy = if user_destroy.nil?
                       LibGLib::DestroyNotify.null
                     else
                       user_destroy.to_unsafe
                     end

      _retval = LibGtk.gtk_custom_sorter_new(sort_func, user_data, user_destroy)
      @pointer = _retval
    end

    def set_sort_func(sort_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_destroy : Pointer(Void)) : Nil
      # gtk_custom_sorter_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      sort_func = if sort_func.nil?
                    LibGLib::CompareDataFunc.null
                  else
                    sort_func.to_unsafe
                  end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_custom_sorter_set_sort_func(self, sort_func, user_data, user_destroy)
    end
  end
end
