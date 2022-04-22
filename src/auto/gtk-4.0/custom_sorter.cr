require "./sorter"

module Gtk
  # `GtkCustomSorter` is a `GtkSorter` implementation that sorts via a callback
  # function.
  @[GObject::GeneratedWrapper]
  class CustomSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CustomSorterClass), class_init,
        sizeof(LibGtk::CustomSorter), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_custom_sorter_get_type
    end

    # Creates a new `GtkSorter` that works by calling
    # @sort_func to compare items.
    #
    # If @sort_func is %NULL, all items are considered equal.
    def initialize(sort_func : Pointer(Void)?, user_data : Pointer(Void)?, user_destroy : Pointer(Void)?)
      # gtk_custom_sorter_new: (Constructor)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # @user_destroy: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      sort_func = if sort_func.nil?
                    LibGLib::CompareDataFunc.null
                  else
                    sort_func.to_unsafe
                  end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # Generator::NullableArrayPlan
      user_destroy = if user_destroy.nil?
                       LibGLib::DestroyNotify.null
                     else
                       user_destroy.to_unsafe
                     end

      # C call
      _retval = LibGtk.gtk_custom_sorter_new(sort_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
    end

    # Sets (or unsets) the function used for sorting items.
    #
    # If @sort_func is %NULL, all items are considered equal.
    #
    # If the sort func changes its sorting behavior,
    # gtk_sorter_changed() needs to be called.
    #
    # If a previous function was set, its @user_destroy will be
    # called now.
    def set_sort_func(sort_func : Pointer(Void)?, user_data : Pointer(Void)?, user_destroy : Pointer(Void)) : Nil
      # gtk_custom_sorter_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sort_func = if sort_func.nil?
                    LibGLib::CompareDataFunc.null
                  else
                    sort_func.to_unsafe
                  end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_custom_sorter_set_sort_func(self, sort_func, user_data, user_destroy)

      # Return value handling
    end
  end
end
