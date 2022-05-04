require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that invokes a callback.
  @[GObject::GeneratedWrapper]
  class CallbackAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CallbackActionClass), class_init,
        sizeof(LibGtk::CallbackAction), instance_init, 0)
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
      LibGtk.gtk_callback_action_get_type
    end

    # Create a custom action that calls the given @callback when
    # activated.
    def initialize(callback : Gtk::ShortcutFunc?)
      # gtk_callback_action_new: (Constructor)
      # @callback: (nullable)
      # @data: (nullable)
      # Returns: (transfer full)

      # Generator::CallbackArgPlan
      if callback
        _box = ::Box.box(callback)
        callback = ->(lib_widget : Pointer(Void), lib_args : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::GObjectArgPlan
          widget = Gtk::Widget.new(lib_widget, :none)
          # Generator::HandmadeArgPlan
          args = GLib::Variant.new(lib_args, :none)
          # Generator::GObjectArgPlan
          args = GLib::Variant.new(lib_args, :none)
          user_data = lib_user_data
          ::Box(Proc(Gtk::Widget, GLib::Variant?, Bool)).unbox(user_data).call(widget, args)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        callback = data = destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_callback_action_new(callback, data, destroy)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
