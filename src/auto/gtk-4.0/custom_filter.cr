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

    GICrystal.define_new_method(CustomFilter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CustomFilter`.
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
      LibGtk.gtk_custom_filter_get_type
    end

    # Creates a new filter using the given @match_func to filter
    # items.
    #
    # If @match_func is %NULL, the filter matches all items.
    #
    # If the filter func changes its filtering behavior,
    # gtk_filter_changed() needs to be called.
    def initialize(match_func : Gtk::CustomFilterFunc?)
      # gtk_custom_filter_new: (Constructor)
      # @match_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::CallbackArgPlan
      if match_func
        _box = ::Box.box(match_func)
        match_func = ->(lib_item : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          item = GObject::Object.new(lib_item, :none)
          ::Box(Proc(GObject::Object, Bool)).unbox(lib_user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        match_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_custom_filter_new(match_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
    def filter_func=(match_func : Gtk::CustomFilterFunc?) : Nil
      # gtk_custom_filter_set_filter_func: (Method)
      # @match_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if match_func
        _box = ::Box.box(match_func)
        match_func = ->(lib_item : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          item = GObject::Object.new(lib_item, :none)
          ::Box(Proc(GObject::Object, Bool)).unbox(lib_user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        match_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_custom_filter_set_filter_func(@pointer, match_func, user_data, user_destroy)

      # Return value handling
    end
  end
end
