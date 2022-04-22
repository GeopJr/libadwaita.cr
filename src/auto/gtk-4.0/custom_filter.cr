require "./filter"

module Gtk
  # `GtkCustomFilter` determines whether to include items with a callback.
  @[GObject::GeneratedWrapper]
  class CustomFilter < Filter
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CustomFilterClass), class_init,
        sizeof(LibGtk::CustomFilter), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_custom_filter_get_type
    end

    # Creates a new filter using the given @match_func to filter
    # items.
    #
    # If @match_func is %NULL, the filter matches all items.
    #
    # If the filter func changes its filtering behavior,
    # gtk_filter_changed() needs to be called.
    def initialize(match_func : Pointer(Void)?, user_data : Pointer(Void)?, user_destroy : Pointer(Void))
      # gtk_custom_filter_new: (Constructor)
      # @match_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      match_func = if match_func.nil?
                     LibGtk::CustomFilterFunc.null
                   else
                     match_func.to_unsafe
                   end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_custom_filter_new(match_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
    end

    # Sets the function used for filtering items.
    #
    # If @match_func is %NULL, the filter matches all items.
    #
    # If the filter func changes its filtering behavior,
    # gtk_filter_changed() needs to be called.
    #
    # If a previous function was set, its @user_destroy will be
    # called now.
    def set_filter_func(match_func : Pointer(Void)?, user_data : Pointer(Void)?, user_destroy : Pointer(Void)) : Nil
      # gtk_custom_filter_set_filter_func: (Method)
      # @match_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      match_func = if match_func.nil?
                     LibGtk::CustomFilterFunc.null
                   else
                     match_func.to_unsafe
                   end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_custom_filter_set_filter_func(self, match_func, user_data, user_destroy)

      # Return value handling
    end
  end
end
