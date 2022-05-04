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
      LibGtk.gtk_custom_sorter_get_type
    end

    # Creates a new `GtkSorter` that works by calling
    # @sort_func to compare items.
    #
    # If @sort_func is %NULL, all items are considered equal.
    def initialize(sort_func : GLib::CompareDataFunc?)
      # gtk_custom_sorter_new: (Constructor)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # @user_destroy: (nullable)
      # Returns: (transfer full)

      # Generator::CallbackArgPlan
      if sort_func
        _box = ::Box.box(sort_func)
        sort_func = ->(lib_a : Pointer(Void), lib_b : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::NullableArrayPlan
          a = (lib_a.null? ? nil : lib_a)
          # Generator::NullableArrayPlan
          b = (lib_b.null? ? nil : lib_b)
          user_data = lib_user_data
          ::Box(Proc(Pointer(Void)?, Pointer(Void)?, Int32)).unbox(user_data).call(a, b)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        sort_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_custom_sorter_new(sort_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
    def sort_func=(sort_func : GLib::CompareDataFunc?) : Nil
      # gtk_custom_sorter_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if sort_func
        _box = ::Box.box(sort_func)
        sort_func = ->(lib_a : Pointer(Void), lib_b : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::NullableArrayPlan
          a = (lib_a.null? ? nil : lib_a)
          # Generator::NullableArrayPlan
          b = (lib_b.null? ? nil : lib_b)
          user_data = lib_user_data
          ::Box(Proc(Pointer(Void)?, Pointer(Void)?, Int32)).unbox(user_data).call(a, b)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        sort_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_custom_sorter_set_sort_func(self, sort_func, user_data, user_destroy)

      # Return value handling
    end
  end
end
